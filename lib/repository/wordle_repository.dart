import 'package:dio/dio.dart';
import 'package:wordle_flutter/models/wordle_model.dart';
import 'package:wordle_flutter/repository/models/wordle_response.dart';

import 'models/wordle_request.dart';

class WordleRepository {
  Future<WordleResponse> retrieve(Wordle wordle) async {
    var dio = Dio();
    final response = await dio.post("https://tronxi.ddns.net/wordle-nginx/wordle", data: WordleRequest(wordle.word.split("")).toJson());
    if (response.statusCode != 200) {
      throw Exception();
    }
    return WordleResponse.fromJson(response.data);
  }
}
