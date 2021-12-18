import 'package:flutter/material.dart';

class BlogClubLogo extends StatelessWidget {
  const BlogClubLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          DecoratedBox(
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            child: Padding(
              padding: EdgeInsets.all(2.0),
              child: Text(
                'BLOG',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  letterSpacing: 3.5,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.1, 0.0),
            child: Text(
              'CLUB',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 25.0,
                letterSpacing: 3.5,
              ),
            ),
          )
        ],
      ),
    );
  }
}
