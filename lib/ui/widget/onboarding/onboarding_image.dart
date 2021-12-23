import 'package:flutter/material.dart';

class OnboardingImage extends StatelessWidget {
  final String imagePath;
  const OnboardingImage({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(imagePath),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(24.0)),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFe8e8e8),
            blurRadius: 10.0,
            offset: Offset(0.0, 15.0),
          ),
        ],
      ),
    );
  }
}
