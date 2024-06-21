class Chat {
  final String name;
  final List<Message> messages;

  Chat({
    required this.name,
    required this.messages,
  });
}

class Message {
  final String text;
  final bool isSentByMe; // Indicates whether the message is sent by the current user

  Message({
    required this.text,
    required this.isSentByMe,
  });
}
List<Chat> chats = [
  Chat(
    name: "Chat 1",
    messages: [
      Message(text: "Message 1", isSentByMe: true),
      Message(text: "Message 2", isSentByMe: false),
      // Add more messages as needed
    ],
  ),
  Chat(
    name: "Chat 2",
    messages: [
      Message(text: "Message 1", isSentByMe: true),
      // Add more messages as needed
    ],
  ),
  // Add more chats as needed
];
