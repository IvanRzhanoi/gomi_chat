import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gomi_chat/element/comment_container.dart';
import 'model/comment.dart';


class ChatRoom extends StatefulWidget {
  final String chatID;
  final String title;
  const ChatRoom(this.chatID, this.title);

  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  List<Comment> comments = [];
  final _firestore = FirebaseFirestore.instance;

  final myController = TextEditingController();
  var username = "not found";

  @override
  initState() {
    super.initState();
    loadUsername();
  }

  loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String usernameStorage = prefs.getString('username') ?? "anonym";
    setState(() {
      username = usernameStorage;
    });
  }


  void sendMessage() async {
    _firestore
        .collection('comments')
        .add({
      'chat': widget.chatID,
      'comment': myController.text,
      'username': username,
      'createdAt': Timestamp.now()
    })
        .then((value) => print("Comment added"))
        .catchError((error) => print("Failed to add comment: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 100),
            child: Container(
              child: StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('comments')
                    .where('chat', isEqualTo: widget.chatID)
                    .orderBy('createdAt', descending: true)
                    .snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) return new Text('Loading...');
                  return new ListView(
                    reverse: true,
                    children: snapshot.data!.docs.map((DocumentSnapshot comment) {
                      return CommentContainer(
                        comment: Comment(
                          // I've tried to do some error handling, but failed.
                          // For the purposes of this task I chose to assume that
                          // my database is perfect and incorruptible, because everything I do is perfect
                          chatID: comment["chat"],
                          poster: comment.get("username"),//["username"],
                          comment: comment["comment"],
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      controller: myController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Message',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    tooltip: 'Go to the next page',
                    onPressed: () {
                      sendMessage();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
