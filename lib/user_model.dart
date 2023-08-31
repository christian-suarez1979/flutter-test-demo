import 'dart:convert';

class User {
  final String email;
  final String name;
  final int id;
  final String website;

  User({
    required this.email,
    required this.name,
    required this.id,
    required this.website,
  });

  User copyWith({String? email, String? name, int? id, String? website}) {
    return User(
      email: email ?? this.email,
      name: name ?? this.name,
      id: id ?? this.id,
      website: website ?? this.website,
    );
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      id: map['id'].toInt() ?? 0,
      website: map['website'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    result.addAll({'email': email});
    result.addAll({'name': name});
    result.addAll({'id': id});
    result.addAll({'website': website});
    return result;
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  factory User.fromJsonList(Map<String, dynamic> json) {
    return User(
      email: json['email'] ?? '',
      name: json['name'] ?? '',
      id: json['id'].toInt() ?? 0,
      website: json['website'] ?? '',
    );
  }
}
