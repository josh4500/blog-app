import 'package:flutter/material.dart';

class ArticleHeader extends StatelessWidget {
  final String title;
  final String publisherName;
  final String publisherImagepath;
  final String postTime;
  final bool bookmarked;
  const ArticleHeader({
    Key? key,
    required this.title,
    required this.publisherName,
    required this.publisherImagepath,
    required this.postTime,
    required this.bookmarked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 40, 24, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.chevron_left,
                  size: 35,
                ),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz))
            ],
          ),
          const SizedBox(height: 15),
          Text(
            title,
            style: const TextStyle(fontSize: 30.0, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 15),
          ListTile(
            contentPadding: const EdgeInsets.all(0.0),
            leading: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              child: Image.asset(
                publisherImagepath,
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(publisherName,
                style: const TextStyle(fontWeight: FontWeight.w400)),
            subtitle: Text(postTime),
            trailing: SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.send),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.bookmark_border,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
