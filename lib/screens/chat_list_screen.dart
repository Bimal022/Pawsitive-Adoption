import 'package:flutter/material.dart';
import 'package:pawsitive_adoption/screens/chat_screen.dart';
import 'package:pawsitive_adoption/utils/data.dart';
import 'package:pawsitive_adoption/widgets/chat_item.dart';
import 'package:pawsitive_adoption/widgets/custom_textbox.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  getBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHeader(),
          _buildChats(),
        ],
      ),
    );
  }

  _buildHeader() {
    return Padding(
      padding: EdgeInsets.fromLTRB(15, 60, 15, 5),
      child: Column(
        children: [
          Text(
            "Chats",
            style: TextStyle(
              fontSize: 28,
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 15),
          CustomTextBox(
            hint: "Search",
            prefix: Icon(Icons.search, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  _buildChats() {
    return ListView(
      padding: EdgeInsets.all(10),
      shrinkWrap: true,
      children: List.generate(
        chats.length,
        (index) => ChatItem(
          chats[index],
          onTap: () { // Navigate to ChatScreen on tap
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatScreen(personName: chats[index]["fname"] as String),
              ),
            );
          },
        ),
      ),
    );
  }
}