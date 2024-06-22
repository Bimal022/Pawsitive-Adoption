import 'package:flutter/material.dart';
import 'package:pawsitive_adoption/theme/color.dart'; // Import your color scheme

class ChatScreen extends StatelessWidget {
  final String personName;

  const ChatScreen({Key? key, required this.personName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBgColor, // Use app background color
      appBar: AppBar(
        backgroundColor: AppColor.appBarColor, // Use app bar color
        title: Text(
          personName,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 10),
              itemCount: 10, // Replace with actual number of messages
              itemBuilder: (context, index) {
                // Replace this with actual chat message widget
                return ChatMessage(
                  message: 'This is message $index',
                  isMe: index % 2 == 0, // Example: alternate messages
                );
              },
            ),
          ),
          _buildInputField(), // Input field for typing messages
        ],
      ),
    );
  }

  Widget _buildInputField() {
    return Container(
      padding: EdgeInsets.all(10),
      color:
          AppColor.appBarColor, // Use app bar color for input field background
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type a message...',
                hintStyle: TextStyle(color: Colors.white54),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor:
                    Colors.white.withOpacity(0.1), // Semi-transparent white
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
              ),
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(width: 10),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              // Send message functionality
            },
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String message;
  final bool isMe;

  const ChatMessage({Key? key, required this.message, required this.isMe})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Align(
        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isMe ? Colors.blueAccent : Colors.grey.withOpacity(0.5),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            message,
            style: TextStyle(color: isMe ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}
