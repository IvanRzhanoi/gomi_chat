import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Container(
            height: 320,
            width: double.infinity,
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('comments').where('chat', isEqualTo: widget.chatID).snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) return new Text('Loading...');
                return new ListView(
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

          Align(
            alignment: Alignment.bottomLeft,
            child: TextField(
              //controller: myController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'My username',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
