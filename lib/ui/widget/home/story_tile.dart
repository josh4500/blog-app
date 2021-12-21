import 'package:flutter/material.dart';
import 'package:status_view/status_view.dart';

class StoryTile extends StatelessWidget {
  final String imageUrl;
  final String username;
  final int numOfStatus;
  const StoryTile(
      {Key? key,
      required this.imageUrl,
      required this.username,
      required this.numOfStatus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 8.0, 8.0, 8.0),
      child: Column(
        children: [
          StatusView(
            numberOfStatus: numOfStatus,
            strokeWidth: 2,
            radius: 30,
            centerImageUrl: imageUrl,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(username),
          ),
        ],
      ),
    );
  }
}
