import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key, required this.imageUrl}) : super(key: key);

  final String imageUrl; // 이미지

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  bool isFavorite = false; // 좋아요

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 이미지
        Image.network(
          widget.imageUrl,
          height: 400,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Row(
          // 버튼
          children: [
            IconButton(// 좋아요
              icon: Icon(
                CupertinoIcons.heart,
                color: isFavorite ? Colors.pink : Colors.black,
              ),
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
            ),
            IconButton( // 댓글
              icon: Icon(CupertinoIcons.chat_bubble, color: Colors.black),
              onPressed: () {},
            ),
            Spacer(),
            IconButton( // 북마크
              icon: Icon(CupertinoIcons.bookmark, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
        // 좋아요 수
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("2 likes", style: TextStyle(fontWeight: FontWeight.bold)),
        ),

        // 설명 텍스트
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "My cat is docile even when bathed. I put a duck on his head in the wick and he's staring at me. Isn't it so cute??",
          ),
        ),

        // 날짜 텍스트
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("FEBURARY 6", style: TextStyle(color: Colors.grey)),
        ),
      ],
    );
  }
}
