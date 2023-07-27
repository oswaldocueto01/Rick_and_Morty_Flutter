// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) =>
    LocationModel(
      Info.fromJson(json['info'] as Map<String, dynamic>),
      (json['results'] as List<dynamic>)
          .map((e) => LocationResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LocationModelToJson(LocationModel instance) =>
    <String, dynamic>{
      'info': instance.info,
      'results': instance.results,
    };

LocationResult _$LocationResultFromJson(Map<String, dynamic> json) =>
    LocationResult(
      json['id'] as int,
      json['name'] as String,
      json['type'] as String,
      json['dimension'] as String,
      (json['residents'] as List<dynamic>).map((e) => e as String).toList(),
      json['url'] as String,
      json['created'] as String,
    );

Map<String, dynamic> _$LocationResultToJson(LocationResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'dimension': instance.dimension,
      'residents': instance.residents,
      'url': instance.url,
      'created': instance.created,
    };
