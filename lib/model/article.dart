import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:blog_app/model/publisher.dart';
import 'package:blog_app/utils/enum/enum.dart';

class Article {
  final String titleId;
  final String title;
  final Publisher author;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;
  final List<AriticleCategoryEnum>? tags;
  final List<Map<int, String>>? media;
  final List<String>? links;
  final int likes;
  final int shares;

  Article({
    required this.titleId,
    required this.title,
    required this.author,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
    this.tags,
    this.media,
    this.links,
    this.likes = 0,
    this.shares = 0,
  });

  Article copyWith({
    String? titleId,
    String? title,
    Publisher? author,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
    List<AriticleCategoryEnum>? tags,
    List<Map<int, String>>? media,
    List<String>? links,
    int? likes,
    int? shares,
  }) {
    return Article(
      titleId: titleId ?? this.titleId,
      title: title ?? this.title,
      author: author ?? this.author,
      description: description ?? this.description,
      url: url ?? this.url,
      urlToImage: urlToImage ?? this.urlToImage,
      publishedAt: publishedAt ?? this.publishedAt,
      content: content ?? this.content,
      tags: tags ?? this.tags,
      media: media ?? this.media,
      links: links ?? this.links,
      likes: likes ?? this.likes,
      shares: shares ?? this.shares,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'titleId': titleId,
      'title': title,
      'author': author.toMap(),
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content,
      'tags': null, //TODO: tags,
      'media': media,
      'links': links,
      'likes': likes,
      'shares': shares,
    };
  }

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      titleId: map['titleId'] ?? '',
      title: map['title'] ?? '',
      author: Publisher.fromMap(map['author']),
      description: map['description'] ?? '',
      url: map['url'] ?? '',
      urlToImage: map['urlToImage'] ?? '',
      publishedAt: map['publishedAt'] ?? '',
      content: map['content'] ?? '',
      tags: map['tags'] != null
          ? List<AriticleCategoryEnum>.from(map['tags'])
          : null,
      media: map['media'] != null
          ? List<Map<int, String>>.from(map['media'])
          : null,
      links: List<String>.from(map['links']),
      likes: map['likes']?.toInt() ?? 0,
      shares: map['shares']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Article.fromJson(String source) =>
      Article.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Article(titleId: $titleId, title: $title, author: $author, description: $description, url: $url, urlToImage: $urlToImage, publishedAt: $publishedAt, content: $content, tags: $tags, media: $media, links: $links, likes: $likes, shares: $shares)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Article &&
        other.titleId == titleId &&
        other.title == title &&
        other.author == author &&
        other.description == description &&
        other.url == url &&
        other.urlToImage == urlToImage &&
        other.publishedAt == publishedAt &&
        other.content == content &&
        listEquals(other.tags, tags) &&
        listEquals(other.media, media) &&
        listEquals(other.links, links) &&
        other.likes == likes &&
        other.shares == shares;
  }

  @override
  int get hashCode {
    return titleId.hashCode ^
        title.hashCode ^
        author.hashCode ^
        description.hashCode ^
        url.hashCode ^
        urlToImage.hashCode ^
        publishedAt.hashCode ^
        content.hashCode ^
        tags.hashCode ^
        media.hashCode ^
        links.hashCode ^
        likes.hashCode ^
        shares.hashCode;
  }
}
