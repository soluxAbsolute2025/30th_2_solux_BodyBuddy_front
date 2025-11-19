import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> dataList = [
      // 리스트에 표시할 카테고리 + 이미지 데이터
      {
        "category": "수제버거",
        "imgUrl":
            "https://devclass.devstory.co.kr/flutter-basic/1/food-burger.jpg",
      },
      {
        "category": "건강식",
        "imgUrl":
            "https://devclass.devstory.co.kr/flutter-basic/1/food-soup.jpg",
      },
      {
        "category": "한식",
        "imgUrl":
            "https://devclass.devstory.co.kr/flutter-basic/1/food-korean-meals.jpg",
      },
      {
        "category": "디저트",
        "imgUrl":
            "https://devclass.devstory.co.kr/flutter-basic/1/food-tiramisu.jpg",
      },
      {
        "category": "피자",
        "imgUrl":
            "https://devclass.devstory.co.kr/flutter-basic/1/food-pizza.jpg",
      },
      {
        "category": "볶음밥",
        "imgUrl":
            "https://devclass.devstory.co.kr/flutter-basic/1/food-pizza.jpg",
      },
    ];

    return Scaffold(
      // 상단 AppBar
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Food Recipe",
          style: TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              print("go my page");
            },
            icon: Icon(Icons.person_outline),
          ),
        ],
      ),
      // 메인 Body
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "상품을 검색해주세요.",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    print("돋보기 아이콘 클릭");
                  },
                ),
              ),
            ),
          ),
          Divider(height: 1),

          Expanded( // 카테고리 리스트 영역
            child: ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> data = dataList[index];
                String category = data["category"];
                String imgUrl = data["imgUrl"];

                return Card(
                  margin: const EdgeInsets.all(8),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.network( // 배경 이미지
                        imgUrl,
                        width: double.infinity,
                        height: 120,
                        fit: BoxFit.cover,
                      ),

                      Container( // 오버레이
                        width: double.infinity,
                        height: 120,
                        color: Colors.black.withOpacity(0.5),
                      ),

                      Text( // 카테고리 텍스트
                        category,
                        style: TextStyle(color: Colors.white, fontSize: 36),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),

      // 사이드 메뉴 - Drawer
      drawer: Drawer(
        child: Column(
          children: [
            // 사용자 정보
            DrawerHeader(
              margin: const EdgeInsets.all(0),
              decoration: BoxDecoration(color: Colors.amber),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 36,
                      backgroundColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                          "https://devclass.devstory.co.kr/flutter-basic/1/cat.png",
                          width: 62,
                        ),
                      ),
                    ),
                    SizedBox(height: 13),
                    Text(
                      "닉네임",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "hello@world.com",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),

            // 배너 슬라이드
            AspectRatio(
              aspectRatio: 12 / 4,
              child: PageView(
                children: [
                  Image.network(
                    "https://devclass.devstory.co.kr/flutter-basic/1/sale-event-banner1.jpg",
                  ),
                  Image.network(
                    "https://devclass.devstory.co.kr/flutter-basic/1/sale-event-banner2.jpg",
                  ),
                  Image.network(
                    "https://devclass.devstory.co.kr/flutter-basic/1/sale-event-banner3.jpg",
                  ),
                  Image.network(
                    "https://devclass.devstory.co.kr/flutter-basic/1/sale-event-banner4.jpg",
                  ),
                ],
              ),
            ),

            // 메뉴 버튼들
            ListTile(
              title: Text('구매내역', style: TextStyle(fontSize: 18)),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              title: Text('저장한 레시피', style: TextStyle(fontSize: 18)),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
