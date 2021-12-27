import 'package:blog_app/ui/widget/article/article_tags.dart';
import 'package:flutter/material.dart';

class NewArticleScreen extends StatefulWidget {
  const NewArticleScreen({Key? key}) : super(key: key);

  @override
  State<NewArticleScreen> createState() => _NewArticleScreenState();
}

class _NewArticleScreenState extends State<NewArticleScreen> {
  final List<String> _tagList = ['suigetsu', 'jugo', 'karin'];
  late TextEditingController _tagController;

  @override
  void initState() {
    super.initState();
    _tagController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 50, 24, 24),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'New Article',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                  ),
                  const SizedBox(height: 30),
                  const TextField(
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    decoration: InputDecoration.collapsed(hintText: 'title'),
                  ),
                  const Divider(thickness: 2.0),
                  const SizedBox(height: 10),
                  const TextField(
                    style: TextStyle(fontSize: 18),
                    decoration: InputDecoration.collapsed(hintText: 'subtitle'),
                  ),
                  const Divider(thickness: 2.0),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _tagController,
                    decoration: InputDecoration(
                      hintText: 'Tags',
                      hintStyle: const TextStyle(color: Colors.blue),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          if (_tagController.text.isNotEmpty) {
                            setState(() {
                              _tagList.add(_tagController.text);
                            });
                            print(_tagList);
                          }
                          _tagController.clear();
                        },
                        child: const Icon(Icons.add),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Wrap(
                    children: [
                      for (int i = 0; i < _tagList.length; i++)
                        ArticleTags(
                          tag: _tagList[i],
                          removeTag: () {
                            setState(() {
                              _tagList.removeAt(i);
                            });
                          },
                        ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Article content',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  const Divider(thickness: 2.0),
                  const TextField(
                    maxLines: null,
                    decoration: InputDecoration.collapsed(hintText: ''),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(bottom: 30),
                padding: const EdgeInsets.all(8),
                width: double.maxFinite,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.blue.shade900,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 5,
                        offset: Offset(0, 5),
                      ),
                    ],),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.close,
                        size: 30,
                      ),
                    ),
                    const Icon(
                      Icons.image,
                      color: Colors.white,
                    ),
                    const Icon(
                      Icons.video_library,
                      color: Colors.white,
                    ),
                    const Icon(
                      Icons.link,
                      color: Colors.white,
                    ),
                    Row(
                      children: const [
                        Text(
                          'T',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'T',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
