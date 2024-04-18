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
  int counter = 0;

  void onClick() {
    setState(() {
      //State클래스에게 데이터가 변경되었다고 알리는 함수
      counter = counter + 1;
    });
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
              Text('$counter'),
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
