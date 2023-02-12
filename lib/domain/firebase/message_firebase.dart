import 'package:cloud_firestore/cloud_firestore.dart';

class MessageFirebase {
  String id;
  final String text;
  final String user;
  final DateTime createAt;

  MessageFirebase({
    this.id = '',
    required this.text,
    required this.user,
    required this.createAt,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'text': text,
    'user': user,
    'createAt': createAt,
  };

  static MessageFirebase fromJson(Map<String, dynamic> json) => MessageFirebase(
    id: json['id'],
    text: json['text'],
    user: json['user'],
    createAt: (json['createAt'] as Timestamp).toDate(),
  );
}