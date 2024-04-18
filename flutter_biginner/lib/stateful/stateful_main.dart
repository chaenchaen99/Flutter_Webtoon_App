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
  //Dart 클래스 프로퍼티
  List<int> numbers = [];

  void onClick() {
    setState(() {
      //State클래스에게 데이터가 변경되었다고 알리는 함수
      //아래 있는 build method를 다시 실행시킴
      numbers.add(numbers.length);
    });

    numbers.add(numbers.length);
    print(numbers.length);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Click Count'),
              for (var n in numbers) Text('$n'),
              TextButton(
                onPressed: onClick,
                child: const Text('+'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
