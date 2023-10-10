import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_up/common_widget/common_text.dart';
import 'package:grade_up/extension/media_query_extension.dart';
import 'package:grade_up/firebase_api/firebase_api.dart';
import 'package:grade_up/screen/bottom_navigation_bar_screen/account_screen/edit_profile/edit_profile_screen.dart';
import 'package:grade_up/screen/login_screen/login_screen.dart';
import 'package:image_picker/image_picker.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  File? file;

  Future<void> selecteImageFromGallery() async {
    ImagePicker pickImageData = ImagePicker();

    XFile? xfile = await pickImageData.pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
    );

    file = xfile != null ? File(xfile.path) : null;
    setState(() {});
  }

  late Future<List<Map>> futureUserData;

  String key = '';

  @override
  void initState() {
    futureUserData = FirebaseApi.selectData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 70),
                height: 250,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 60),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Account',
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  selecteImageFromGallery();
                  setState(() {});
                },
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: file != null
                      ? FileImage(file!)
                      : const AssetImage('assets/prof_cplus.jpg')
                          as ImageProvider,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          FutureBuilder(
            future: futureUserData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                key = snapshot.data![0]['key'];
                return Container(
                  height: 280,
                  width: context.screenWidth * 0.9,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(),
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            commonText(data: "Student Name", size: 17),
                            commonText(data: "Mobile No", size: 17),
                            commonText(data: "Email", size: 17),
                            commonText(data: "Age", size: 17),
                            commonText(data: "Gender", size: 17),
                            commonText(data: "Address", size: 17),
                          ],
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            commonText(
                                data: ":- \t${snapshot.data![0]['userName']}",
                                size: 17),
                            commonText(
                                data: ":- \t${snapshot.data![0]['mobNum']}",
                                size: 17),
                            commonText(
                                data: ":- \t${snapshot.data![0]['email']}",
                                size: 17),
                            commonText(
                                data: ":- \t${snapshot.data![0]['age']}",
                                size: 17),
                            commonText(
                                data: ":- \t${snapshot.data![0]['gender']}",
                                size: 17),
                            commonText(
                                data: ":- \t${snapshot.data![0]['address']}",
                                size: 17),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return Container(
                  width: context.screenWidth * 0.9,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          commonText(data: "Student Name", size: 17),
                          commonText(data: "Mobile No", size: 17),
                          commonText(data: "Email", size: 17),
                          commonText(data: "Age", size: 17),
                          commonText(data: "Gender", size: 17),
                          commonText(data: "Address", size: 17),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          commonText(data: ":- profile Name", size: 17),
                          commonText(data: ":- Mobile No", size: 17),
                          commonText(data: ":- Email", size: 17),
                          commonText(data: ":- Age", size: 17),
                          commonText(data: ":- Gender", size: 17),
                          commonText(data: ":- Adress", size: 17),
                        ],
                      ),
                    ],
                  ),
                );
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                minimumSize: MaterialStateProperty.all(
                  Size(context.screenWidth, 55),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfileScreen(
                      keyName: key,
                    ),
                  ),
                );
              },
              child: Text(
                'Edit Profile',
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                minimumSize: MaterialStateProperty.all(
                  Size(context.screenWidth, 55),
                ),
              ),
              onPressed: () {
                FirebaseApi.removeData(key: key);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
              child: Text(
                'Logout',
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
