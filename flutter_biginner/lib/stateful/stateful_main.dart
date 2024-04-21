import 'package:flutter/material.dart';

void main() {
  runApp(const StatefulMain());
}

class StatefulMain extends StatefulWidget {
  const StatefulMain({super.key});

  @override
  State<StatefulMain> createState() => _StatefulMainState();
}

class _StatefulMainState extends State<StatefulMain> {
  bool showTitle = true;

  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    //BuildContext를 통해서 아주 먼 곳의 요소에 접근할 수 있다.
    //위젯트리에서 위젯의 위치를 제공하고, 이를 통해 상위 요소 데이터에 접근할 수 있다.
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showTitle ? const MyLargeTitle() : const Text('notiong'),
              IconButton(
                onPressed: toggleTitle,
                icon: const Icon(Icons.remove_red_eye),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({super.key});

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  int count = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    //위젯이 스크린에서 제거될 때 호출
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'My Large Title',
      style: TextStyle(
          fontSize: 30, color: Theme.of(context).textTheme.titleLarge?.color),
    );
  }
}
