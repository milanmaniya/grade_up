import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:grade_up/pdf_crud_operation/common_string.dart';

class MainPdfScreen extends StatefulWidget {
  const MainPdfScreen({super.key});

  @override
  State<MainPdfScreen> createState() => _MainPdfScreenState();
}

class _MainPdfScreenState extends State<MainPdfScreen> {
  List<String> courseName = ['BBA', 'BCA'];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
          itemCount: courseName.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AllYearSemScreen(
                    name: courseName[index],
                  ),
                ),
              );
              setState(() {
                TText.courseName = courseName[index];
              });
            },
            child: Container(
              height: 100,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(16),
              ),
              alignment: Alignment.center,
              child: Text(
                courseName[index],
                style: Theme.of(context).textTheme.labelMedium!.apply(
                      color: Colors.black,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AllYearSemScreen extends StatefulWidget {
  const AllYearSemScreen({super.key, required this.name});

  final String name;

  @override
  State<AllYearSemScreen> createState() => _AllYearSemScreenState();
}

class _AllYearSemScreenState extends State<AllYearSemScreen> {
  List<String> allYearSemList = [];

  final FirebaseFirestore firebaseStore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection(widget.name).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasData) {
            for (var element in snapshot.data!.docs) {
              allYearSemList.add(element.id);
            }
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AllSubjectScreen(
                        name: allYearSemList[index],
                      ),
                    ),
                  );
                  setState(() {
                    TText.semName = allYearSemList[index];
                  });
                },
                child: Container(
                  height: 100,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    allYearSemList[index],
                    style: Theme.of(context).textTheme.labelMedium!.apply(
                          color: Colors.black,
                        ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class AllSubjectScreen extends StatefulWidget {
  const AllSubjectScreen({super.key, required this.name});

  final String name;

  @override
  State<AllSubjectScreen> createState() => _AllSubjectScreenState();
}

class _AllSubjectScreenState extends State<AllSubjectScreen> {
  List<String>? allSubjectNameList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.name,
          style: Theme.of(context).textTheme.labelLarge!.apply(
                color: Colors.black,
              ),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('BCA')
            .doc(widget.name)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            for (var element in snapshot.data!.get('Subject')) {
              allSubjectNameList!.add(element);
            }
          }

          return ListView.builder(
            itemCount: allSubjectNameList!.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AllChapterScreen(
                      subjectName: allSubjectNameList![index],
                    ),
                  ),
                );
                setState(() {
                  TText.subjectName = allSubjectNameList![index];
                });
              },
              child: Container(
                height: 100,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(16),
                ),
                alignment: Alignment.center,
                child: Text(
                  allSubjectNameList![index],
                  style: Theme.of(context).textTheme.labelLarge!.apply(
                        color: Colors.black,
                      ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class AllChapterScreen extends StatefulWidget {
  const AllChapterScreen({super.key, required this.subjectName});

  final String subjectName;

  @override
  State<AllChapterScreen> createState() => _AllChapterScreenState();
}

class _AllChapterScreenState extends State<AllChapterScreen> {
  List<Map<String, dynamic>>? pdfData = [];

  double? _progress;

  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<String> uploadPdf(String fileName, File file) async {
    final reference = FirebaseStorage.instance.ref(
        "${TText.courseName}/${TText.semName}/${TText.subjectName}/$fileName.pdf");

    final uploadTask = reference.putFile(file);

    await uploadTask.whenComplete(() {});

    final downloadLink = reference.getDownloadURL();

    return downloadLink;
  }

  Future<void> piclFile() async {
    final pickedFile = await FilePicker.platform.pickFiles(
      allowedExtensions: ['pdf'],
      type: FileType.custom,
    );

    if (pickedFile != null) {
      String fileName = pickedFile.files[0].name;

      File file = File(pickedFile.files[0].path!);

      log(fileName);

      final downloadLink = await uploadPdf(fileName, file);

      log(downloadLink);

      firebaseFirestore
          .collection(TText.courseName)
          .doc(TText.semName)
          .collection(TText.subjectName)
          .doc(fileName)
          .set({
        'Name': fileName,
        'downloadUrl': downloadLink,
      });

      log('Pdf Upload Successfully');
    }
    setState(() {
      _progress = null;
    });
  }

  @override
  void initState() {
    log('${TText.courseName}/${TText.semName}/${TText.subjectName}');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainPdfScreen(),
                ),
                (route) => false);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        title: Text(widget.subjectName),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection(TText.courseName)
              .doc(TText.semName)
              .collection(TText.subjectName)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasData) {
              for (var element in snapshot.data!.docs) {
                if (pdfData!.contains(element.data())) {
                  pdfData = null;
                } else {
                  pdfData!.add(element.data());
                }
              }
            }
            return snapshot.hasData
                ? GridView.builder(
                    itemCount: snapshot.data!.docs.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PdfViewScreen(
                              pdfUrl: pdfData![index]['downloadUrl'].toString(),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.grey,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                _progress != null
                                    ? Center(
                                        child: CircularProgressIndicator(
                                          value: _progress,
                                        ),
                                      )
                                    : DropdownButton(
                                        items: const [
                                          DropdownMenuItem(
                                            child: Text('Download'),
                                          ),
                                        ],
                                        onChanged: (value) {
                                          FileDownloader.downloadFile(
                                            onDownloadCompleted: (path) {
                                              setState(() {
                                                log('path $path');
                                                _progress = null;
                                              });
                                            },
                                            onProgress: (fileName, progress) {
                                              setState(() {
                                                _progress = progress;
                                              });
                                            },
                                            url: pdfData![index]['downloadUrl']
                                                .toString()
                                                .trim(),
                                          );
                                        },
                                      ),
                              ],
                            ),
                            const Icon(
                              Icons.picture_as_pdf_rounded,
                              size: 40,
                              color: Colors.red,
                            ),
                            Text(
                              pdfData![index]['Name'].toString(),
                              textAlign: TextAlign.center,
                              style:
                                  Theme.of(context).textTheme.labelLarge!.apply(
                                        color: Colors.black,
                                      ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : const Center(
                    child: Text('Pdf not available'),
                  );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: piclFile,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class PdfViewScreen extends StatefulWidget {
  const PdfViewScreen({super.key, required this.pdfUrl});

  final String pdfUrl;

  @override
  State<PdfViewScreen> createState() => _PdfViewScreenState();
}

class _PdfViewScreenState extends State<PdfViewScreen> {
  PDFDocument? document;

  Future<void> initializePdf() async {
    document = await PDFDocument.fromURL(widget.pdfUrl);
    setState(() {});
  }

  @override
  void initState() {
    initializePdf();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: document != null
          ? PDFViewer(
              document: document!,
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}