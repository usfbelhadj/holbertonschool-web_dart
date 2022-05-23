import '6-password.dart';

class User extends Password {
  int? id;
  String name;
  int age;
  double height;

  final pass = Password(password: "Testing67");

  User(
      {int? this.id,
      required this.name,
      required this.age,
      required this.height});

  Map toJson() {
    return {"id": id, "name": name, "age": age, "height": height};
  }

  static User fromJson(Map<dynamic, dynamic> userJson) {
    final userId = userJson['id'] as int;
    final userName = userJson['name'] as String;
    final userAge = userJson['age'] as int;
    final userHeight = userJson['height'] as double;
    return User(id: userId, name: userName, age: userAge, height: userHeight);
  }

  @override
  String toString() =>
      'User(id : $id ,name: $name,  age: $age, height: $height, Password: ${pass.isValid()})';
}
