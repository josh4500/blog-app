import 'package:blog_app/data/article_category_list.dart';
import 'package:blog_app/data/story_list.dart';
import 'package:blog_app/ui/widget/home/article_category_tile.dart';
import 'package:blog_app/ui/widget/home/story_tile.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
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
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
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
                    height: 280,
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
                  const SizedBox(height: 10.0),
                  Container(
                    height: 120,
                    width: double.infinity,
                    padding: const EdgeInsets.only(right: 10.0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(6.0, 6.0),
                          blurRadius: 15.0,
                          spreadRadius: -13,
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 120,
                          width: 90,
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12.0)),
                            child: Image.asset(
                              'assets/images/art.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10.0),
                              const Text(
                                'BIG DATA',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: const Text(
                                    'Why are the Uchihas this cool?',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: const [
                                      Icon(
                                        Icons.favorite_border_outlined,
                                        size: 16.0,
                                      ),
                                      Text('1.2k'),
                                    ],
                                  ),
                                  Row(
                                    children: const [
                                      Icon(
                                        Icons.timer,
                                        size: 16.0,
                                      ),
                                      Text('1hr ago'),
                                    ],
                                  ),
                                  const Icon(
                                    Icons.bookmark,
                                    size: 16.0,
                                    color: Colors.blue,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10.0,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
