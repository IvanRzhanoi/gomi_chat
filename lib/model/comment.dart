import 'package:flutter/material.dart';

class Comment {
  Comment({
    required this.chatID,
    this.poster = "Anonymous",
    required this.comment,
  });

  String chatID;
  String poster;
  String comment;
}

var sampleComments = [
  Comment(chatID: "General", poster: "Anonym", comment: "I like garbage"),
  Comment(chatID: "General", poster: "noRagretZ", comment: "Me too!"),
  Comment(chatID: "metal garbage", poster: "Your mom", comment: "Likewise, gentlemen! My mental capacity is limited"),
];