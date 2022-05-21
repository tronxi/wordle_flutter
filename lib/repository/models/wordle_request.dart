import 'package:json_annotation/json_annotation.dart';

part 'wordle_request.g.dart';

@JsonSerializable()
class WordleRequest {
  final List<String> letters;

  const WordleRequest(this.letters);

  factory WordleRequest.fromJson(Map<String, dynamic> json) => _$WordleRequestFromJson(json);

  Map<String, dynamic> toJson() => _$WordleRequestToJson(this);
}
