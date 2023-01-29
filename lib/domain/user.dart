class User {
  final int id;
  final String? avatar;
  final String pseudo;

  User({
    required this.id,
    this.avatar,
    required this.pseudo,
  });

  // User copyAndChange() {
  //   return User(
  //     name: name,
  //     isSelected: !isSelected,
  //     lastUpdatedDate: DateTime.now(),
  //   );
  // }
}
