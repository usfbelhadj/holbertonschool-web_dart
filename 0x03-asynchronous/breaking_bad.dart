import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<void> printBbCharacters() async {
  final response = await http.get(
    Uri.parse('https://www.breakingbadapi.com/api/characters'),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response, then parse the JSON.
    var resJson = jsonDecode(response.body);
    for (var i = 0; i < resJson.length; i++) {
      print(resJson[i]["name"]);
    }
    print("\n");
  } else {
    // If the server did not return a 200 OK response, then throw an exception.
    throw Exception('Failed to load album');
  }
}

main() async {
  await printBbCharacters();
}
