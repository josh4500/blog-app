import 'package:blog_app/ui/widget/article/article_action_button.dart';
import 'package:blog_app/ui/widget/article/article_tags.dart';
import 'package:blog_app/ui/widget/article/expandable_fab.dart';
import 'package:flutter/material.dart';

class NewArticleScreen extends StatefulWidget {
  const NewArticleScreen({Key? key}) : super(key: key);

  @override
  State<NewArticleScreen> createState() => _NewArticleScreenState();
}

class _NewArticleScreenState extends State<NewArticleScreen> {
  final List<String> _tagList = ['suigetsu', 'jugo', 'karin'];
  late TextEditingController _tagController;
  bool isExpanded = false;

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
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
                  ),
                  const SizedBox(height: 30),
                  const TextField(
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    decoration: InputDecoration.collapsed(hintText: 'Title'),
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
                      hintText: 'Add Tags',
                      hintStyle: const TextStyle(color: Colors.blue),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          if (_tagController.text.isNotEmpty) {
                            setState(() {
                              _tagList.add(_tagController.text);
                            });
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
                    decoration: InputDecoration.collapsed(
                        hintText: 'Type here',
                        hintStyle: TextStyle(fontStyle: FontStyle.italic)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: ExpandableFab(
        distance: 112.0,
        children: [
          ArticleActionButton(
            onPressed: () {},
            icon: const Icon(Icons.insert_photo),
          ),
          ArticleActionButton(
            onPressed: () {},
            icon: const Icon(Icons.add_a_photo),
          ),
          ArticleActionButton(
            onPressed: () {},
            icon: const Icon(Icons.insert_link),
          ),
        ],
      ),
    );
  }
}
