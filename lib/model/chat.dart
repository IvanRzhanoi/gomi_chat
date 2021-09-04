import 'package:flutter/material.dart';

class Chat {
  Chat({
    this.roomName = "not found",
    this.latestComment = "no comments",
  });

  String roomName;
  String latestComment;
}

var samplePosts = [
  Chat(roomName: "General garbage", latestComment: "comment 1"),
  Chat(roomName: "Plastic", latestComment: "comment 2"),
  Chat(roomName: "Bio degradable", latestComment: """
Comment 3, which is very long and defines the current state of affairs in the 
world where we don't know what might be happening at a any given moment, 
but we march ahead anyway."""
  ),
];