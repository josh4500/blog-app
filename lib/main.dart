import 'package:blog_app/ui/screens/article/article.dart';
import 'package:blog_app/ui/screens/authentication/authentication.dart';

import 'package:blog_app/ui/screens/home/homepage.dart';
import 'package:blog_app/ui/screens/onboarding/onboarding_screen.dart';
import 'package:blog_app/ui/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BlogClub(title: 'Flutter Demo Home Page'),
    );
  }
}

class BlogClub extends StatefulWidget {
  const BlogClub({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<BlogClub> createState() => _BlogClubState();
}

class _BlogClubState extends State<BlogClub> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
