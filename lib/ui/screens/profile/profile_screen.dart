import 'package:blog_app/data/article_list.dart';
import 'package:blog_app/ui/widget/profile/profile_header.dart';
import 'package:blog_app/ui/widget/shared/article_list_tile.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9FAFF),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              sliver: SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Profile',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.more_horiz))
                  ],
                ),
              ),
            ),
            const SliverPadding(padding: EdgeInsets.only(bottom: 20)),
            const SliverToBoxAdapter(child: ProfileHeader()),
            const SliverPadding(padding: EdgeInsets.only(bottom: 70)),
            SliverFillRemaining(
              child: Container(
                  padding: const EdgeInsets.all(24.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.0),
                      topRight: Radius.circular(24.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFe8e8e8),
                        offset: Offset(0.0, -15.0),
                        blurRadius: 15.0,
                      ),
                    ],
                  ),
                  child: CustomScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    slivers: [
                      SliverToBoxAdapter(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'My Posts',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: const [
                                Icon(Icons.grid_view),
                                SizedBox(width: 10.0),
                                Icon(Icons.list)
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SliverPadding(padding: EdgeInsets.only(bottom: 20)),
                      SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          return ArticleListTile(article: articleList[index]);
                        }, childCount: articleList.length),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
