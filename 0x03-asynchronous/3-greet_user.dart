import 'dart:convert';

import '3-util.dart';

Future<String> greetUser() async {
  try {
    var getData = await fetchUserData();
    var data = json.decode(getData);
    return 'Hello ${data["username"]}';
  } catch (err) {
    return 'error caught: $err';
  }
}

Future<String> loginUser() async {
  var checkc = await checkCredentials();
  print("There is a user: $checkc");
  if (checkc == true) {
    return greetUser();
  }
  return "Wrong credentials";
}
