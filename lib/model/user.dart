import 'dart:convert';

class User {
  final String uid;
  final String name;
  final String email;
  final String photoUrl;
  final String phone;
  final String address;
  final String city;
  final String state;
  final String zip;
  final String country;
  final String website;
  final String about;
  final String facebook;
  final String instagram;
  final String youtube;
  User({
    required this.uid,
    required this.name,
    required this.email,
    required this.photoUrl,
    required this.phone,
    required this.address,
    required this.city,
    required this.state,
    required this.zip,
    required this.country,
    required this.website,
    required this.about,
    required this.facebook,
    required this.instagram,
    required this.youtube,
  });

  User copyWith({
    String? uid,
    String? name,
    String? email,
    String? photoUrl,
    String? phone,
    String? address,
    String? city,
    String? state,
    String? zip,
    String? country,
    String? website,
    String? about,
    String? facebook,
    String? instagram,
    String? youtube,
  }) {
    return User(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      city: city ?? this.city,
      state: state ?? this.state,
      zip: zip ?? this.zip,
      country: country ?? this.country,
      website: website ?? this.website,
      about: about ?? this.about,
      facebook: facebook ?? this.facebook,
      instagram: instagram ?? this.instagram,
      youtube: youtube ?? this.youtube,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'photoUrl': photoUrl,
      'phone': phone,
      'address': address,
      'city': city,
      'state': state,
      'zip': zip,
      'country': country,
      'website': website,
      'about': about,
      'facebook': facebook,
      'instagram': instagram,
      'youtube': youtube,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      photoUrl: map['photoUrl'] ?? '',
      phone: map['phone'] ?? '',
      address: map['address'] ?? '',
      city: map['city'] ?? '',
      state: map['state'] ?? '',
      zip: map['zip'] ?? '',
      country: map['country'] ?? '',
      website: map['website'] ?? '',
      about: map['about'] ?? '',
      facebook: map['facebook'] ?? '',
      instagram: map['instagram'] ?? '',
      youtube: map['youtube'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(uid: $uid, name: $name, email: $email, photoUrl: $photoUrl, phone: $phone, address: $address, city: $city, state: $state, zip: $zip, country: $country, website: $website, about: $about, facebook: $facebook, instagram: $instagram, youtube: $youtube)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.uid == uid &&
        other.name == name &&
        other.email == email &&
        other.photoUrl == photoUrl &&
        other.phone == phone &&
        other.address == address &&
        other.city == city &&
        other.state == state &&
        other.zip == zip &&
        other.country == country &&
        other.website == website &&
        other.about == about &&
        other.facebook == facebook &&
        other.instagram == instagram &&
        other.youtube == youtube;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        name.hashCode ^
        email.hashCode ^
        photoUrl.hashCode ^
        phone.hashCode ^
        address.hashCode ^
        city.hashCode ^
        state.hashCode ^
        zip.hashCode ^
        country.hashCode ^
        website.hashCode ^
        about.hashCode ^
        facebook.hashCode ^
        instagram.hashCode ^
        youtube.hashCode;
  }
}
