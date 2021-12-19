import 'package:blog_app/data/article_category_list.dart';
import 'package:blog_app/data/article_list.dart';
import 'package:blog_app/data/story_list.dart';
import 'package:blog_app/ui/widget/home/article_category_tile.dart';
import 'package:blog_app/ui/widget/home/story_tile.dart';
import 'package:blog_app/ui/widget/shared/article_list_tile.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  //2803#

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Hi, Ukitake!',
                style: TextStyle(fontSize: 20.0),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_active))
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Text(
            'Explore today\`s',
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10.0,
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: storyList.length,
              itemBuilder: (context, index) {
                return StoryTile(
                    numOfStatus: storyList[index].numOfStory,
                    imageUrl: storyList[index].imageUrl,
                    username: storyList[index].username);
              },
            ),
          ),
          const SizedBox(height: 10.0),
          SizedBox(
            height: 220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: articleCategoryList.length,
              itemBuilder: (context, index) {
                return ArticleCategoryTile(
                  imagePath: articleCategoryList[index].imagePath,
                  name: articleCategoryList[index].category,
                );
              },
            ),
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Latest News',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'More',
                  style: TextStyle(color: Colors.blue),
                ),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: articleList.length,
                itemBuilder: (context, index) {
                  return ArticleListTile(article: articleList[index]);
                }),
          )
        ],
      ),
    ));
  }
}
