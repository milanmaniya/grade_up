import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BasicBookScreen extends StatefulWidget {
  const BasicBookScreen({super.key});

  @override
  State<BasicBookScreen> createState() => _BasicBookScreenState();
}

class _BasicBookScreenState extends State<BasicBookScreen> {
  late Future<List<dynamic>> books;

  Future<List> fetchBooks() async {
    const url = "https://www.googleapis.com/books/v1/volumes?q=java";

    final uri = Uri.parse(url);

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body) as Map;

      final data = result['items'] as List;

      // log(data.toString());

      return data;
    } else {
      return [];
    }
  }

  final txtSearch = TextEditingController();

  @override
  void initState() {
    books = fetchBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: RefreshIndicator(
                onRefresh: fetchBooks,
                child: FutureBuilder(
                  future: fetchBooks(),
                  builder: (context, snapshot) {
                    final data = [];

                    if (snapshot.hasData) {
                      for (var element in snapshot.data!) {
                        // log(element['volumeInfo'].toString());
                        data.add(element['volumeInfo']);
                      }
                    }

                    return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            data[index]['title'],
                            maxLines: 1,
                            style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          subtitle: Text(
                            data[index]!['publisher'],
                            maxLines: 1,
                            style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          trailing: Text(data[index]['publishedDate']),
                          leading: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(
                                  data[index]['imageLinks']['thumbnail'],
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
