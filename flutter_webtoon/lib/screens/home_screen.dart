import 'package:flutter/material.dart';
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
            //Future가 완료되서 데이터가 존재하면
            return ListView.separated(
              //ListView.builder는 사용자가 보고있는 아이템만 빌드한다.
              //사용자가 보고있지 않는 아이템들은 메모리에서 제거한다.
              //필요할 때 아이템을 만든다.
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                print(index);
                var webtoon = snapshot.data![index];
                return Text(webtoon.title);
              },
              separatorBuilder: (context, index) => const SizedBox(
                width: 20,
              ),
            );
            //ListView: 많은 양의 데이터를 연속적으로 보여줄 때 사용. 여러항목을 나열하는 데 최적화된 Widget
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
