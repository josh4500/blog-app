import 'package:blog_app/data/article_category_list.dart';
import 'package:blog_app/data/article_list.dart';
import 'package:blog_app/data/story_list.dart';
import 'package:blog_app/ui/widget/home/article_category_tile.dart';
import 'package:blog_app/ui/widget/home/story_tile.dart';
import 'package:blog_app/ui/widget/shared/article_list_tile.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //2803#
  late PageController _pageController;
  double currentPage = 0.0;
  final _scaleFactor = 0.85;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.65);
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFE8ECF4),
      body: Padding(
        padding: const EdgeInsets.only(left: 24.0, top: 40),
        child: ScrollConfiguration(
          behavior: const ScrollBehavior(),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Row(
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
              ),
              const SliverToBoxAdapter(
                child: Text(
                  'Explore today\'s',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
              ),
              const SliverPadding(padding: EdgeInsets.only(bottom: 10.0)),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 100,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: storyList.length,
                    itemBuilder: (context, index) {
                      return StoryTile(
                        numOfStatus: storyList[index].numOfStory,
                        imageUrl: storyList[index].imageUrl,
                        username: storyList[index].username,
                      );
                    },
                  ),
                ),
              ),
              const SliverPadding(padding: EdgeInsets.only(bottom: 10.0)),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 220,
                  child: PageView.builder(
                    allowImplicitScrolling: true,
                    itemCount: articleCategoryList.length,
                    padEnds: false,
                    controller: _pageController,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Transform(
                          transform: _transformMatrix(index),
                          child: ArticleCategoryTile(
                            imagePath: articleCategoryList[index].imagePath,
                            name: articleCategoryList[index].category,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SliverPadding(padding: EdgeInsets.only(bottom: 10.0)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
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
                ),
              ),
              const SliverPadding(padding: EdgeInsets.only(bottom: 10.0)),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return ArticleListTile(article: articleList[index]);
                  },
                  childCount: articleList.length,
                ),
              ),
              const SliverPadding(padding: EdgeInsets.only(bottom: 20.0)),
            ],
          ),
        ),
      ),
    );
  }

  Matrix4 _transformMatrix(int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == currentPage.floor()) {
      var currentScale = 1 - (currentPage - index) * (1 - _scaleFactor);
      matrix = Matrix4.diagonal3Values(1.0, currentScale, 1.0);
    } else if (index == currentPage.floor() + 1) {
      var currentScale =
          _scaleFactor + (currentPage - index + 1) * (1 - _scaleFactor);
      matrix = Matrix4.diagonal3Values(1.0, currentScale, 1.0);
    } else if (index == currentPage.floor() - 1) {
      var currentScale = 0.85;
      matrix = Matrix4.diagonal3Values(1.0, currentScale, 1.0);
    } else {
      var currentScale = 0.85;
      matrix = Matrix4.diagonal3Values(1.0, currentScale, 1.0);
    }
    return matrix;
  }
}
