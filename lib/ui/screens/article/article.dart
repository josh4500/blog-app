import 'package:blog_app/data/article_category_list.dart';
import 'package:blog_app/data/article_list.dart';
import 'package:blog_app/ui/widget/article/article_header.dart';
import 'package:blog_app/ui/widget/article/likes_button.dart';
import 'package:flutter/material.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9FAFF),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: ArticleHeader(
                title: 'Why You Should Respect The Uchihas',
                publisherName: 'Gerald Shin',
                publisherImagepath: articleList[1].urlToImage,
                postTime: '2m ago',
                bookmarked: true,
              ),
            ),
            const SliverPadding(padding: EdgeInsets.only(bottom: 10.0)),
            SliverToBoxAdapter(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24.0),
                    topRight: Radius.circular(24.0),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(articleList[1].urlToImage),
                  ),
                ),
              ),
            ),
            const SliverPadding(padding: EdgeInsets.only(bottom: 20.0)),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const Text(
                      'A Uchiha should never be approached alone in the battle field. They\'re the battle gods.',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                        '''Adopting the identity of the spiral-patterned Zetsu which served as his bodysuit during his recuperation, Tobi, Obito poses as the carefree flunky and becomes Sasoris replacement and Deidaras partner early in Part II.[20] After Itachis death, Obito takes a special interest in Sasuke Uchiha and takes him under his wing by revealing the truth about their clans massacre.[21] He presents himself as Madara after Nagatos death, revealing the Eye of the Moon Plan to the Kage and explaining his intention to become the Ten-Tails Jinchuriki to bring all life within an Infinite Tsukuyomi. After the Kage refuse to surrender to him, Obito declares the Fourth Great Ninja War and forms a reluctant alliance with Kabuto Yakushi, who blackmails him with the real Madaras body''')
                  ],
                ),
              ),
            ),
            const SliverPadding(padding: EdgeInsets.only(bottom: 20.0))
          ],
        ),
      ),
      floatingActionButton: const LikeButton(),
    );
  }
}
