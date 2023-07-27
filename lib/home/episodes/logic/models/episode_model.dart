import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty/home/characters/logic/models/character_model.dart';

part 'episode_model.g.dart';

@JsonSerializable()
class EpisodeModel {
  Info info;
  List<Episode> results;

  EpisodeModel(this.info, this.results);

  factory EpisodeModel.fromJson(Map<String, dynamic> json) =>
      _$EpisodeModelFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeModelToJson(this);
}


@JsonSerializable(fieldRename: FieldRename.snake)
class Episode {
  int id;
  String name;
  String airDate;
  String episode;
  List<String> characters;
  String url;
  String created;

  Episode(this.id, this.name, this.airDate, this.episode, this.characters,
      this.url, this.created);

  factory Episode.fromJson(Map<String, dynamic> json) =>
      _$EpisodeFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeToJson(this);
}
