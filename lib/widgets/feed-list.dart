import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:first_app/utils/feed-utils.dart';
import 'package:http/http.dart';

class FeedList extends StatefulWidget {
  @override
  FeedListState createState() => FeedListState();
}

class Feed {
  final String id;
  final String avatarUrl;
  final String email;
  final String uid;
  final String posts;
  final String type;
  final DateTimeRange createdAt;

  Feed(
      {@required this.id,
      @required this.avatarUrl,
      @required this.email,
      @required this.uid,
      @required this.posts,
      @required this.type,
      @required this.createdAt});

  factory Feed.fromJson(Map<String, dynamic> json) {
    return Feed(
        id: json['_id'],
        avatarUrl: json['avatarUrl'],
        email: json['email'],
        uid: json['uid'],
        posts: json['posts'],
        type: json['type'],
        createdAt: json['createdAt']);
  }
}

class FeedListState extends State<FeedList> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ABOBA PARSE'),
      ),
    );
  }
}
