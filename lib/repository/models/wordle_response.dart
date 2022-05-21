import 'package:json_annotation/json_annotation.dart';

part 'wordle_response.g.dart';

enum WordleStatusResponse {
  Pending, Invalid, Completed;
}

enum WordleLetterStatus {
  Fail, Unordered, Ordered
}

@JsonSerializable()
class WordleResponse {
  final WordleStatusResponse wordleStatus;
  final List<WordleLetterStatus> letterStatusList;

  const WordleResponse(this.wordleStatus, this.letterStatusList);

  factory WordleResponse.fromJson(Map<String, dynamic> json) => _$WordleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WordleResponseToJson(this);
}
