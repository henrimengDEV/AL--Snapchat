import 'package:cloud_firestore/cloud_firestore.dart';

class UserFirebase {
  String id;
  final String avatar;
  final String pseudo;
  final DateTime createAt;

  UserFirebase({
    this.id = '',
    required this.avatar,
    required this.pseudo,
    required this.createAt,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'avatar': avatar,
    'pseudo': pseudo,
    'createAt': createAt,
  };

  static UserFirebase fromJson(Map<String, dynamic> json) => UserFirebase(
    id: json['id'],
    avatar: json['avatar'],
    pseudo: json['pseudo'],
    createAt: (json['createAt'] as Timestamp).toDate(),
  );

  @override
  String toString() {
    return 'UserFirebase{id: $id, pseudo: $pseudo, createAt: $createAt}';
  }
}