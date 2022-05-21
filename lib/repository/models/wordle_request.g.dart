// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wordle_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WordleRequest _$WordleRequestFromJson(Map<String, dynamic> json) =>
    WordleRequest(
      (json['letters'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$WordleRequestToJson(WordleRequest instance) =>
    <String, dynamic>{
      'letters': instance.letters,
    };
