import 'package:flutter/material.dart';
import 'package:gomi_chat/element/chatroom_container.dart';
import 'package:gomi_chat/profile_screen.dart';

import 'element/comment_container.dart';

class ChatList extends StatefulWidget {
  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Time to post some garbage'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            tooltip: 'Go to the next page',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return ProfileScreen();
                },
              ));
            },
          ),
        ],
      ),
      body:
      ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ChatroomContainer();
        },
      ),
      //],
      // ),
    );
  }
}
