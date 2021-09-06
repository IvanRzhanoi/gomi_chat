import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gomi_chat/element/chatroom_container.dart';
import 'package:gomi_chat/profile_screen.dart';

import 'model/chat.dart';

class ChatList extends StatefulWidget {
  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  List<Chat> chats = [];
  final _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    loadChats();
  }

  void loadChats() {
    _firestore
        .collection("chats")
        .get()
        .then((snapshot) {
      snapshot.docs.forEach((element) {
        setState(() {
          chats.add(
            Chat(
              chatID: element.id,
              name: element["name"],
              // I could do something smarter with this,
              // like downloading the latest comment from "comments" collection.
              // Alas, I have no time or desire to work with it
              latestComment: "no latest comment could be loaded",
            ),
          );
        });
      });
    });
  }

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
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          return ChatroomContainer(chat: chats[index]);
        },
      ),
    );
  }
}
