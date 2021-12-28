import 'package:flutter/material.dart';

class ArticleTags extends StatelessWidget {
  final String tag;
  final VoidCallback removeTag;
  const ArticleTags({Key? key, required this.tag, required this.removeTag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5.0, bottom: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.blue, width: 2.0)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(tag, style: const TextStyle(color: Colors.blue)),
          ),
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.blue.shade100),
            child: GestureDetector(
              onTap: removeTag,
              child: Icon(Icons.close, color: Colors.blue.shade300),
            ),
          )
        ],
      ),
    );
  }
}
