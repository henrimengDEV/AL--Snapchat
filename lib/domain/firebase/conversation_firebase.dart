class ConversationFirebase {
  String id;
  final List<String> messages;
  final List<String> users;

  ConversationFirebase({
    this.id = '',
    required this.messages,
    required this.users,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'messages': messages,
        'users': users,
      };

  static ConversationFirebase fromJson(Map<String, dynamic> json) =>
      ConversationFirebase(
        id: json['id'],
        messages: (json['messages'] as List<dynamic>)
            .map((e) => e.toString())
            .toList(),
        users:
            (json['users'] as List<dynamic>).map((e) => e.toString()).toList(),
      );
}
