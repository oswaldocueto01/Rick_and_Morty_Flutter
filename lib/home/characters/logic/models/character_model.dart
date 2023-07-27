

import 'package:json_annotation/json_annotation.dart';

part 'character_model.g.dart';


@JsonSerializable()
class CharacterModel {
  Info info;
  List<Character> results;


  CharacterModel(this.info, this.results);

  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterModelToJson(this);
}

@JsonSerializable()
class Info {
  int count;
  int pages;
  String? next;
  String? prev;

  Info(this.count, this.pages, this.next, this.prev);

  factory Info.fromJson(Map<String, dynamic> json) =>
      _$InfoFromJson(json);

  Map<String, dynamic> toJson() => _$InfoToJson(this);
}

@JsonSerializable()
class Character {
  int id;
  String name;
  String status;
  String species;
  String type;
  String gender;
  Origin origin;
  Location location;
  String image;
  List<String> episode;
  String url;
  String created;


  Character(this.id, this.name, this.status, this.species, this.type,
      this.gender, this.origin, this.location, this.image, this.episode,
      this.url, this.created);

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterToJson(this);
}

@JsonSerializable()
class Origin {
  String name;
  String url;


  Origin(this.name, this.url);

  factory Origin.fromJson(Map<String, dynamic> json) =>
      _$OriginFromJson(json);

  Map<String, dynamic> toJson() => _$OriginToJson(this);
}
@JsonSerializable()
class Location {
  String name;
  String url;


  Location(this.name, this.url);

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

