import 'package:final_flutter_project/domain/user.dart';
import 'package:flutter/foundation.dart';

@immutable
class Friend {
  final int id;
  final User sourceUser;
  final User targetUser;
  final DateTime createdAt;

  const Friend({
    required this.id,
    required this.sourceUser,
    required this.targetUser,
    required this.createdAt,
  });

  Friend copyWith({
    User? sourceUser,
    User? targetUser,
    DateTime? createdAt,
  }) {
    return Friend(
      id: id,
      sourceUser: sourceUser ?? this.sourceUser,
      targetUser: targetUser ?? this.targetUser,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
