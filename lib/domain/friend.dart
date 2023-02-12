import 'package:final_flutter_project/domain/user/user.dart';
import 'package:flutter/foundation.dart';

@immutable
class Friend {
  final int id;
  final User sourceUserId;
  final User targetUserId;
  final DateTime createdAt;

  const Friend({
    required this.id,
    required this.sourceUserId,
    required this.targetUserId,
    required this.createdAt,
  });

  Friend copyWith({
    User? sourceUser,
    User? targetUser,
    DateTime? createdAt,
  }) {
    return Friend(
      id: id,
      sourceUserId: sourceUser ?? this.sourceUserId,
      targetUserId: targetUser ?? this.targetUserId,
      createdAt: createdAt ?? this.createdAt,
    );
  }


}
