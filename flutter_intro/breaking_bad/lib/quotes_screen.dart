import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class QuotesScreen extends StatelessWidget {
  final String name;
  final int id;
  const QuotesScreen({Key? key, required this.id, required this.name})
      : super(key: key);

  Future<List> fetchQuote(id) async {
    // ignore: non_constant_identifier_names
    List Quots = [];
    try {
      final response = await http.get(
        Uri.parse('https://breakingbadapi.com/api/quotes'),
      );
      var resJson = jsonDecode(response.body);
      for (var i = 0; i < resJson.length; i++) {
        if (resJson[i]["author"] == name) {
          Quots.add(resJson[i]["quote"]);
        }
      }
      return Quots;
    } catch (e) {
      Quots.add(e);
      return Quots;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Breaking Bad Quots'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder(
        future: fetchQuote(id),
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
                var l = snapshot.data;
                return ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: l.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Text(
                        '* ${l[index]}',
                        style: const TextStyle(
                            fontSize: 20.0, fontFamily: 'quoteScript'),
                      );
                    });
              }
          }
        },
      ),
    );
  }
}
