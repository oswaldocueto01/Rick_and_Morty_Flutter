import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty/home/characters/logic/models/character_model.dart';

part 'location_model.g.dart';

@JsonSerializable()
class LocationModel {
  Info info;
  List<LocationResult> results;

  LocationModel(this.info, this.results);

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}


@JsonSerializable()
class LocationResult{
  int id;
  String name;
  String type;
  String dimension;
  List<String> residents;
  String url;
  String created;


  LocationResult(this.id, this.name, this.type, this.dimension, this.residents,
      this.url, this.created);

  factory LocationResult.fromJson(Map<String, dynamic> json) =>
      _$LocationResultFromJson(json);

  Map<String, dynamic> toJson() => _$LocationResultToJson(this);
}
