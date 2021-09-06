import 'package:flutter/material.dart';

class Chat {
  Chat({
    required this.chatID,
    this.name = "not found",
    this.latestComment = "no comments",
  });

  String chatID;
  String name;
  String latestComment;
}

var sampleChats = [
  Chat(chatID: "JnifHRHGtIjinpNYVvLe", name: "General garbage", latestComment: "comment 1"),
  Chat(chatID: "JnifHRHGtIjinpNYVvLe", name: "Plastic", latestComment: "comment 2"),
  Chat(chatID: "JnifHRHGtIjinpNYVvLe", name: "Bio degradable", latestComment: """
Comment 3, which is very long and defines the current state of affairs in the 
world where we don't know what might be happening at a any given moment, 
but we march ahead anyway."""
  ),
  Chat(chatID: "JnifHRHGtIjinpNYVvLe", name: "General garbage", latestComment: "comment 1"),
  Chat(chatID: "JnifHRHGtIjinpNYVvLe", name: "Plastic", latestComment: "comment 2"),
  Chat(chatID: "JnifHRHGtIjinpNYVvLe", name: "Bio degradable", latestComment: """
Comment 3, which is very long and defines the current state of affairs in the 
world where we don't know what might be happening at a any given moment, 
but we march ahead anyway."""
  ),
  Chat(chatID: "JnifHRHGtIjinpNYVvLe", name: "General garbage", latestComment: "comment 1"),
  Chat(chatID: "JnifHRHGtIjinpNYVvLe", name: "Plastic", latestComment: "comment 2"),
  Chat(chatID: "JnifHRHGtIjinpNYVvLe", name: "Bio degradable", latestComment: """
Comment 3, which is very long and defines the current state of affairs in the 
world where we don't know what might be happening at a any given moment, 
but we march ahead anyway."""
  ),
  Chat(chatID: "JnifHRHGtIjinpNYVvLe", name: "General garbage", latestComment: "comment 1"),
  Chat(chatID: "JnifHRHGtIjinpNYVvLe", name: "Plastic", latestComment: "comment 2"),
  Chat(chatID: "JnifHRHGtIjinpNYVvLe", name: "Bio degradable", latestComment: """
Comment 3, which is very long and defines the current state of affairs in the 
world where we don't know what might be happening at a any given moment, 
but we march ahead anyway."""
  ),
];