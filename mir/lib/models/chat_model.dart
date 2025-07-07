class ChatMessage {
  final String user;
  final String content;

  ChatMessage({required this.user, required this.content});

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(user: json['role'], content: json['content']);
  }

  Map<String, dynamic> toJson() {
    return {'role': user, 'content': content};
  }
}
