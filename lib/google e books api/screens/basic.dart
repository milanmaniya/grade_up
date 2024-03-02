import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class BasicBookScreen extends StatefulWidget {
  const BasicBookScreen({super.key});

  @override
  State<BasicBookScreen> createState() => _BasicBookScreenState();
}

class _BasicBookScreenState extends State<BasicBookScreen> {
  late Future<List<dynamic>> books;

  Future<List> fetchBooks(String key) async {
    final url = "https://www.googleapis.com/books/v1/volumes?q=$key";

    final uri = Uri.parse(url);

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body) as Map;

      final data = result['items'] as List;
      return data;
    } else {
      return [];
    }
  }

  final txtSearch = TextEditingController();

  Future<void> urlLauncher(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {}
  }

  @override
  void initState() {
    books = fetchBooks(txtSearch.text);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Library'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: Column(
            children: [
              TextField(
                controller: txtSearch,
                onChanged: (value) {
                  setState(() {
                    txtSearch.text = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
              ),
              Expanded(
                child: FutureBuilder(
                  future: fetchBooks(txtSearch.text),
                  builder: (context, snapshot) {
                    final data = [];

                    if (snapshot.hasData) {
                      for (var element in snapshot.data!) {
                        data.add(element['volumeInfo']);
                      }
                    }

                    if (data.isNotEmpty) {
                      return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {
                              urlLauncher(data[index]['previewLink']);
                            },
                            title: Text(
                              data[index]['title'],
                              maxLines: 1,
                              style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            subtitle: Text(
                              data[index]!['publisher'].toString(),
                              maxLines: 1,
                              style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            trailing:
                                Text(data[index]['publishedDate'].toString()),
                            leading: SizedBox(
                              height: 100,
                              width: 100,
                              child: data[index]['imageLinks']['thumbnail'] !=
                                      null
                                  ? Image.network(
                                      data[index]['imageLinks']['thumbnail'],
                                      height: 120,
                                      width: 100,
                                      fit: BoxFit.cover,
                                    )
                                  : const SizedBox(),
                            ),
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: Text('Data not found'),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
