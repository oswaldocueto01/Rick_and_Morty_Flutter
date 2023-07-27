import 'package:rick_and_morty/core/network/network_service.dart';
import 'package:rick_and_morty/core/utils/logger.dart';
import 'package:rick_and_morty/home/characters/logic/models/character_model.dart';


class CharacterRepository {
 static Future<CharacterModel> getCharacters({int page = 1, required String name, String gender = "", String status = ""}) async {
  try{
    final result = await NetworkService.get(
        path:  "character/?name=$name&gender=$gender&status=$status&page=$page");
    logger.i(result);
    final character = CharacterModel.fromJson(result!);
    return character;
  }catch(e){
    logger.i(e);
    return Future.error(e);
  }
  }
 static Future<List<Character>> getMultipleCharacter(
     {required String characters}) async {
   final result = await NetworkService.get(
       path: "character/$characters,");
   return (result as List).map((e) => Character.fromJson(e)).toList();
 }


}
