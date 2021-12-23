import 'package:flutter/material.dart';

class OnboardingTrack extends StatelessWidget {
  final String title;
  final String body;
  const OnboardingTrack({Key? key, required this.title, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30.0),
          Text(
            body,
          ),
        ],
      ),
    );
  }
}
