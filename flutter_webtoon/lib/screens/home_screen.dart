import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_webtoon/models/webtoon_model.dart';
import 'package:flutter_webtoon/services/api_services.dart';
import 'package:flutter_webtoon/widgets/webtoon_widget.dart';

class HomeScreen extends StatelessWidget {
  //getTodaysToons는 어떤 데이터도 의존하지 않기 때문에 StatelessWidget내에서 사용가능했다.
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
      return Webtoon(
        title: webtoon.title,
        thumb: webtoon.thumb,
        id: webtoon.id,
      );
    },
    separatorBuilder: (context, index) => const SizedBox(
      width: 40,
    ),
  );
}
