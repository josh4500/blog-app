import 'package:blog_app/model/article.dart';

List<Article> articleList = [
  Article.test().copyWith(
    title: 'Eden zero',
    urlToImage: 'assets/images/space.jpg',
    description: 'Space battle ship to leave the milkyway galaxy tomorrow',
    bookmarked: true,
    likes: 253,
  ),
  Article.test().copyWith(
    title: 'Sponge one',
    urlToImage: 'assets/images/obito.jpg',
    description: 'Ghouls in Tokyo eat eliphants',
    bookmarked: true,
    likes: 72,
  ),
  Article.test().copyWith(
    title: 'Mangekyou hypothesis',
    urlToImage: 'assets/images/other.jpg',
    description: 'Theory of sharingan',
    bookmarked: false,
    likes: 91,
  ),
];
