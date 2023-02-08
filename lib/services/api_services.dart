import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/WebtoonModel.dart';

class ApiService {
  static const String BaseUrl =
      "http://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$BaseUrl/$today');
    final respones = await http.get(url);
    if (respones.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(respones.body);
      for (var webtoon in webtoons) {
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonInstances;
    }
    throw Error();
  }
}
