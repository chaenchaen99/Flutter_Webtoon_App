import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_webtoon/models/webtoon_model.dart';
import 'package:flutter_webtoon/services/api_services.dart';

class HomeScreen extends StatelessWidget {
  Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          '오늘의 웹툰',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
      ),
      body: FutureBuilder(
        //FutureBuilder는 future를 기다리고, 데이터가 존재하는지, 로딩중인지, 처리중에 에러가 떴는지를 알려준다.
        //await을 쓰거나, isLoading을 하거나 하는 일은 없다!!
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Expanded(child: makeList(snapshot)),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
  return ListView.separated(
    //ListView.builder는 사용자가 보고있는 아이템만 빌드한다.
    //사용자가 보고있지 않는 아이템들은 메모리에서 제거한다.
    //필요할 때 아이템을 만든다.
    scrollDirection: Axis.horizontal,
    itemCount: snapshot.data!.length,
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    itemBuilder: (context, index) {
      print(index);
      var webtoon = snapshot.data![index];
      return Column(
        children: [
          Container(
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
              webtoon.thumb,
              headers: const {
                "User-Agent":
                    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
              },
              //header를 붙여야 하는 이유: https://velog.io/@wogks27/%EC%9D%B4%EB%AF%B8%EC%A7%80-image.network-403%EC%97%90
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(webtoon.title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w200,
              ))
        ],
      );
    },
    separatorBuilder: (context, index) => const SizedBox(
      width: 40,
    ),
  );
}
