import 'package:rick_and_morty/core/network/network_service.dart';
import 'package:rick_and_morty/home/location/logic/models/location_model.dart';

class LocationRepository {

  static Future<LocationModel> getLocation({int page = 1, required String name}) async {
    try{
      final result = await NetworkService.get(
          path:  "location/?name=$name&page=$page");
      final localization = LocationModel.fromJson(result!);
      return localization;
    }catch(e){
      return Future.error(e);
    }
  }
}