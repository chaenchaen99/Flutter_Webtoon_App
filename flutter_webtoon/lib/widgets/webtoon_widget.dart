import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webtoon/screens/detail_screen.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;

  const Webtoon({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(
                title: title,
                thumb: thumb,
                id: id,
              ),
              fullscreenDialog: true, //아래서 올라오는 뷰
            ));
      },
      child: Column(
        children: [
          Hero(
            tag: id,
            child: Container(
              width: 250,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                //clipBehavior는 자식의 부모 영역 침법을 제어하는 방법
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 15,
                    offset: const Offset(
                      10,
                      10,
                    ),
                    color: Colors.black.withOpacity(0.3),
                  )
                ],
              ),
              child: Image.network(
                thumb,
                headers: const {
                  "User-Agent":
                      "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                },
                //header를 붙여야 하는 이유: https://velog.io/@wogks27/%EC%9D%B4%EB%AF%B8%EC%A7%80-image.network-403%EC%97%90
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w200,
              ))
        ],
      ),
    );
  }
}
