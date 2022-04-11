class Character {
  late String name;
  late String imgUrl;
  late int id;
  Character(this.name, this.imgUrl, this.id);

  Character.fromJson(Map<dynamic, dynamic> json) {
    Character(
      name = json["name"],
      imgUrl = json["img"],
      id = json["char_id"],
    );
  }

  Map<dynamic, dynamic> toJson() => {
        "id": id,
        "name": name,
        "imgUrl": imgUrl,
      };

  @override
  String toString() {
    return "id: $id, name : $name,  img: $imgUrl";
  }
}
