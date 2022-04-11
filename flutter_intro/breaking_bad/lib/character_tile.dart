import 'package:flutter/material.dart';
import 'models.dart';

class CharacterTile extends StatelessWidget {
  final Character character;
  const CharacterTile({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridTile(
        child: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 1),
      itemBuilder: (BuildContext ctx, index) {
        return Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(character.imgUrl),
              fit: BoxFit.cover,
            ),
          ),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              character.name,
              style: const TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
        );
      },
      padding: const EdgeInsets.all(10),
      shrinkWrap: true,
      reverse: false,
    ));
  }
}
