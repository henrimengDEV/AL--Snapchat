import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String? id;
  final String? avatar;
  final String pseudo;
  final DateTime createAt;

  User({
    this.id,
    this.avatar,
    required this.pseudo,
    required this.createAt,
  });

  User copyWith({
    String? id,
    String? avatar,
    String? pseudo,
    DateTime? createAt,
  }) {
    return User(
      id: id ?? this.id,
      avatar: avatar ?? this.avatar,
      pseudo: pseudo ?? this.pseudo,
      createAt: createAt ?? this.createAt,
    );
  }

  static User fromJson(Map<String, dynamic> json) {
    return User(
      avatar: json['avatar'],
      pseudo: json['pseudo'],
      createAt: (json['createAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'avatar': avatar,
    'pseudo': pseudo,
    'createAt': createAt,
  };

  @override
  String toString() {
    return 'User{id: $id, avatar: $avatar, pseudo: $pseudo, createAt: $createAt}';
  }
}
