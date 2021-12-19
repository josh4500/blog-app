import 'package:flutter/material.dart';

class ArticleCategoryTile extends StatelessWidget {
  final String imagePath;
  final String name;
  const ArticleCategoryTile(
      {Key? key, required this.imagePath, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 170,
      margin: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        image: DecorationImage(fit: BoxFit.cover, image: AssetImage(imagePath)),
        borderRadius: const BorderRadius.all(Radius.circular(24.0)),
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 15.0,
            spreadRadius: -15,
            offset: Offset(0.0, 9.0),
          )
        ],
      ),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
