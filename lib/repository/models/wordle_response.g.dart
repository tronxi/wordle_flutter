// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wordle_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WordleResponse _$WordleResponseFromJson(Map<String, dynamic> json) =>
    WordleResponse(
      $enumDecode(_$WordleStatusResponseEnumMap, json['wordleStatus']),
      (json['letterStatusList'] as List<dynamic>)
          .map((e) => $enumDecode(_$WordleLetterStatusEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$WordleResponseToJson(WordleResponse instance) =>
    <String, dynamic>{
      'wordleStatus': _$WordleStatusResponseEnumMap[instance.wordleStatus],
      'letterStatusList': instance.letterStatusList
          .map((e) => _$WordleLetterStatusEnumMap[e])
          .toList(),
    };

const _$WordleStatusResponseEnumMap = {
  WordleStatusResponse.Pending: 'Pending',
  WordleStatusResponse.Invalid: 'Invalid',
  WordleStatusResponse.Completed: 'Completed',
};

const _$WordleLetterStatusEnumMap = {
  WordleLetterStatus.Fail: 'Fail',
  WordleLetterStatus.Unordered: 'Unordered',
  WordleLetterStatus.Ordered: 'Ordered',
};
