import 'package:flutter/material.dart';

class Post {
  Post({
    this.chat = "not found",
    required this.poster,
    required this.comment,
  });

  String chat;
  String poster;
  String comment;
}

var samplePosts = [
  Post(chat: "Garbage", poster: "Anonym", comment: "I like garbage"),
  Post(poster: "noRagretZ", comment: "Me too!"),
  Post(poster: "Your mom", comment: "Likewise, gentlemen! My mental capacity is limited"),
];