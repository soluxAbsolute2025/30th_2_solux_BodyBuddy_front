import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// 1. 로그인 페이지 만들기
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Hello Flutter', style: TextStyle(fontSize: 28)),
        ),
        body: SingleChildScrollView( // 스크롤
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column( // 세로 배치
              children: [
                Padding(
                  padding: const EdgeInsets.all(32),
                  child: Image.network( // 이미지
                    "https://devclass.devstory.co.kr/flutter-basic/1/cat.png",
                    width: 81,
                  ),
                ),
                TextField(decoration: InputDecoration(labelText: "이메일")), // 이메일
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(labelText: "비밀번호"), // 비밀번호
                ),
                Container( // 버튼
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 24),
                  child: ElevatedButton(onPressed: () {}, child: Text("로그인")), // 로그인 버튼
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
