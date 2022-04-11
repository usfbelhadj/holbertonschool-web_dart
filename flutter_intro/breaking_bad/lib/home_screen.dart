// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';
import 'quotes_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Future<List<dynamic>> fetchBbCharacters() async {
    List<dynamic> characList = [];
    final response = await http.get(
      Uri.parse('https://www.breakingbadapi.com/api/characters'),
    );
    var resJson = jsonDecode(response.body);
    for (var i = 0; i < resJson.length; i++) {
      characList.add(resJson[i]);
    }
    return characList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Breaking Bad"),
      ),
      body: FutureBuilder(
        future: fetchBbCharacters(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const SizedBox(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            default:
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 1),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return GestureDetector(
                      onTap: () {
                        const ValueKey("testing");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QuotesScreen(
                                    id: snapshot.data[index]["char_id"],
                                    name: snapshot.data[index]["name"])));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(snapshot.data[index]["img"]),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            '${snapshot.data[index]["name"]}',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 30),
                          ),
                        ),
                      ),
                    );
                  },
                  padding: const EdgeInsets.all(10),
                  shrinkWrap: true,
                  reverse: false,
                );
              }
          }
        },
      ),
    );
  }
}
