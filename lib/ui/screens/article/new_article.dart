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
            // Align(
            //   alignment:
            //       isExpanded ? Alignment.bottomCenter : Alignment.bottomLeft,
            //   child: AnimatedContainer(
            //     duration: const Duration(),
            //     margin: const EdgeInsets.only(bottom: 30),
            //     padding: const EdgeInsets.all(8),
            //     width: isExpanded ? double.maxFinite : 50,
            //     height: 50,
            //     decoration: BoxDecoration(
            //       color: Colors.blue.shade900,
            //       borderRadius: BorderRadius.circular(24),
            //       boxShadow: [
            //         BoxShadow(
            //           color: Colors.black.withOpacity(0.3),
            //           blurRadius: 5,
            //           offset: const Offset(0, 5),
            //         ),
            //       ],
            //     ),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         GestureDetector(
            //           onTap: () {
            //             setState(() {
            //               isExpanded = !isExpanded;
            //             });
            //           },
            //           child: Container(
            //             decoration: const BoxDecoration(
            //               color: Colors.white,
            //               shape: BoxShape.circle,
            //             ),
            //             child: const Icon(
            //               Icons.close,
            //               size: 30,
            //             ),
            //           ),
            //         ),
            //         Visibility(
            //           visible: isExpanded,
            //           child: const Icon(
            //             Icons.image,
            //             color: Colors.white,
            //           ),
            //         ),
            //         Visibility(
            //           visible: isExpanded,
            //           child: const Icon(
            //             Icons.video_library,
            //             color: Colors.white,
            //           ),
            //         ),
            //         Visibility(
            //           visible: isExpanded,
            //           child: const Icon(
            //             Icons.link,
            //             color: Colors.white,
            //           ),
            //         ),
            //         Visibility(
            //           visible: isExpanded,
            //           child: Row(
            //             children: const [
            //               Text(
            //                 'T',
            //                 style: TextStyle(
            //                     color: Colors.white,
            //                     fontWeight: FontWeight.w500),
            //               ),
            //               Text(
            //                 'T',
            //                 style: TextStyle(
            //                   color: Colors.white,
            //                   fontWeight: FontWeight.w500,
            //                   fontSize: 25,
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
      floatingActionButton: ExpandableFab(
        distance: 200.0,
        children: [
          ArticleActionButton(
            onPressed: () {},
            icon: const Icon(Icons.note),
          ),
          ArticleActionButton(
            onPressed: () {},
            icon: const Icon(Icons.insert_photo),
          ),
          ArticleActionButton(
            onPressed: () {},
            icon: const Icon(Icons.videocam),
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
