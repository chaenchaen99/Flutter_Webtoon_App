import 'dart:convert';

import 'package:flutter_webtoon/models/webtoon_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";

  Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    //await 은 asynchronous function(비동기 힘수) 내에서만 사용될 수 있다.
    //데이터가 올 때까지 잠깐 기다려야 하는 경우 await 사용
    //http.get()의 리턴값이 Future()인데 보통 이런 류의 타입과 await를 사용한다.
    //서버에서 요청을 처리하고 응답할 때 까지 기다린다.
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
        //이제 데이터가 다트가 사용할 수 있는 데이터로 바뀜
      }
      return webtoonInstances;
    }
    throw Error();
  }
}
