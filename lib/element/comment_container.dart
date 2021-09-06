import 'package:flutter/material.dart';
import 'package:gomi_chat/model/comment.dart';

// Houses comment with the name of poster
// Could be used to also house links with previews, images and videos
class CommentContainer extends StatelessWidget {
  CommentContainer({required this.comment});
  Comment comment;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Color(0xFFE7EEFB),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF00AEFF),
                offset: Offset(0, 10),
                blurRadius: 30.0,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                comment.poster,
                style: new TextStyle(
                  fontSize: 20.0,
                  color: Color.fromRGBO(176, 5, 45, 1.0),
                ),
              ),
              Text(comment.comment),
            ],
          ),
        ),
      ),
    );
  }
}
