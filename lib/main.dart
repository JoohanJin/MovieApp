import 'package:flutter/material.dart';
import 'package:movieapp/screens/home_screen.dart';

/*
엡은 2개 화면이 있어야 합니다: Home 그리고 Detail.

Home 스크린은 아래와 같은 기능을 갖고있어야 합니다.
가장 인기 있는 영화 목록이 표시되어야 합니다.
극장에서 상영 중인 영화 목록이 표시되어야 합니다.
곧 개봉할 영화 목록이 표시되어야 합니다.
movie를 탭하면 세부정보 화면으로 이동해야 합니다.

세부정보 화면에는 다음이 표시되어야 합니다.
영화의 포스터.
영화의 제목.
영화의 등급.
영화의 개요.
영화의 장르.
*/

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: HomeScreen(),
      ),
    );
  }
}
