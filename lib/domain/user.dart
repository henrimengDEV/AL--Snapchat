class User {
  final int id;
  final String? avatar;
  final String pseudo;
  final DateTime createAt;

  User({
    required this.id,
    this.avatar,
    required this.pseudo,
    required this.createAt,
  });

  User copyWith({
    String? avatar,
    String? pseudo,
    DateTime? createAt,
  }) {
    return User(
      id: id,
      avatar: avatar ?? this.avatar,
      pseudo: pseudo ?? this.pseudo,
      createAt: createAt ?? this.createAt,
    );
  }
}
