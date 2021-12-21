import 'package:blog_app/model/article.dart';
import 'package:flutter/material.dart';

class ArticleListTile extends StatefulWidget {
  final Article article;
  const ArticleListTile({Key? key, required this.article}) : super(key: key);

  @override
  State<ArticleListTile> createState() => _ArticleListTileState();
}

class _ArticleListTileState extends State<ArticleListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      padding: const EdgeInsets.only(right: 10.0),
      margin: const EdgeInsets.only(bottom: 20.0, right: 24.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFe8e8e8),
            offset: Offset(5.0, 5.0),
            blurRadius: 5.0,
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(0.0, -10),
            blurRadius: 5.0,
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            height: 120,
            width: 90,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              child: Image.asset(
                widget.article.urlToImage,
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
                Text(
                  widget.article.title,
                  style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      widget.article.description,
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.favorite_border_outlined,
                          size: 16.0,
                        ),
                        Text(widget.article.likes.toString()),
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
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.article.bookmarked =
                              !widget.article.bookmarked;
                        });
                      },
                      child: widget.article.bookmarked
                          ? const Icon(
                              Icons.bookmark,
                              size: 16.0,
                              color: Colors.blue,
                            )
                          : const Icon(
                              Icons.bookmark_border_outlined,
                              size: 16.0,
                            ),
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
    );
  }
}
