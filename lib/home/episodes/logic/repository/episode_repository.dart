import 'package:rick_and_morty/core/network/network_service.dart';
import 'package:rick_and_morty/core/utils/logger.dart';
import 'package:rick_and_morty/home/characters/logic/models/character_model.dart';
import 'package:rick_and_morty/home/episodes/logic/models/episode_model.dart';

class EpisodeRepository {
  static Future<List<Episode>> getMultipleEpisode(
      {required String episodes}) async {
    final result = await NetworkService.get(
        path: "episode/$episodes,");
    return (result as List).map((e) => Episode.fromJson(e)).toList();
  }


  static Future<EpisodeModel> getEpisode({int page = 1, required String name}) async {
    try{
      final result = await NetworkService.get(
          path:  "episode/?name=$name&page=$page");
      logger.i("${result}");
      final episode = EpisodeModel.fromJson(result!);
      return episode;
    }catch(e){
      logger.i("error in repo${e}");
      return Future.error(e);
    }
  }
}
