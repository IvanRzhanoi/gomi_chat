import 'package:flutter/material.dart';
import 'package:gomi_chat/model/chat.dart';

// Contains the name of chat room and latest comment
class ChatroomContainer extends StatelessWidget {
  ChatroomContainer({required this.chat});
  Chat chat;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF00AEFF),
                offset: Offset(0, 10),
                blurRadius: 30.0,
              ),
              BoxShadow(
                color: Color(0xFF0076FF),
                
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                chat.name,
                style: new TextStyle(
                  fontSize: 20.0,
                  color: Color.fromRGBO(176, 5, 45, 1.0),
                ),
              ),
              Text(chat.latestComment),
            ],
          ),
        ),
      ),
    );
    /*
    return ListTile(
      title: Text('Yes'),
    );
    */
  }
}
