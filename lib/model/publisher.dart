import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:blog_app/model/article.dart';

class Publisher {
  final String uid;
  final String name;
  final String address;
  final String phone;
  final String email;
  final String website;
  final String logo;
  final String description;
  final String facebook;
  final String twitter;
  final String instagram;
  final String youtube;
  final List<Article> articles;
  Publisher({
    required this.uid,
    required this.name,
    required this.address,
    required this.phone,
    required this.email,
    required this.website,
    required this.logo,
    required this.description,
    required this.facebook,
    required this.twitter,
    required this.instagram,
    required this.youtube,
    required this.articles,
  });

  Publisher copyWith({
    String? uid,
    String? name,
    String? address,
    String? phone,
    String? email,
    String? website,
    String? logo,
    String? description,
    String? facebook,
    String? twitter,
    String? instagram,
    String? youtube,
    List<Article>? articles,
  }) {
    return Publisher(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      website: website ?? this.website,
      logo: logo ?? this.logo,
      description: description ?? this.description,
      facebook: facebook ?? this.facebook,
      twitter: twitter ?? this.twitter,
      instagram: instagram ?? this.instagram,
      youtube: youtube ?? this.youtube,
      articles: articles ?? this.articles,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'address': address,
      'phone': phone,
      'email': email,
      'website': website,
      'logo': logo,
      'description': description,
      'facebook': facebook,
      'twitter': twitter,
      'instagram': instagram,
      'youtube': youtube,
      'articles': articles.map((x) => x.toMap()).toList(),
    };
  }

  factory Publisher.fromMap(Map<String, dynamic> map) {
    return Publisher(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      address: map['address'] ?? '',
      phone: map['phone'] ?? '',
      email: map['email'] ?? '',
      website: map['website'] ?? '',
      logo: map['logo'] ?? '',
      description: map['description'] ?? '',
      facebook: map['facebook'] ?? '',
      twitter: map['twitter'] ?? '',
      instagram: map['instagram'] ?? '',
      youtube: map['youtube'] ?? '',
      articles:
          List<Article>.from(map['articles']?.map((x) => Article.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Publisher.fromJson(String source) =>
      Publisher.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Publisher(uid: $uid, name: $name, address: $address, phone: $phone, email: $email, website: $website, logo: $logo, description: $description, facebook: $facebook, twitter: $twitter, instagram: $instagram, youtube: $youtube, articles: $articles)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Publisher &&
        other.uid == uid &&
        other.name == name &&
        other.address == address &&
        other.phone == phone &&
        other.email == email &&
        other.website == website &&
        other.logo == logo &&
        other.description == description &&
        other.facebook == facebook &&
        other.twitter == twitter &&
        other.instagram == instagram &&
        other.youtube == youtube &&
        listEquals(other.articles, articles);
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        name.hashCode ^
        address.hashCode ^
        phone.hashCode ^
        email.hashCode ^
        website.hashCode ^
        logo.hashCode ^
        description.hashCode ^
        facebook.hashCode ^
        twitter.hashCode ^
        instagram.hashCode ^
        youtube.hashCode ^
        articles.hashCode;
  }
}
