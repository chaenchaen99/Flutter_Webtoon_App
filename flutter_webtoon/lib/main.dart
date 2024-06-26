import 'package:flutter/material.dart';
import 'package:flutter_webtoon/screens/home_screen.dart';
import 'package:flutter_webtoon/services/api_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  //위젯은 ID 같은 식별자 역할을 하는 key가 있다.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
