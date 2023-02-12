class FriendFirebase {
  String id;
  final List<String> users;

  FriendFirebase({
    this.id = '',
    required this.users,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'users': users,
  };

  static FriendFirebase fromJson(Map<String, dynamic> json) => FriendFirebase(
    id: json['id'],
    users: json['users'],
  );
}