import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/core/utils/logger.dart';
import 'package:rick_and_morty/home/characters/logic/models/character_model.dart';
import 'package:rick_and_morty/home/characters/logic/repository/character_repository.dart';
import 'package:rick_and_morty/home/episodes/logic/models/episode_model.dart';
import 'package:rick_and_morty/home/location/logic/models/location_model.dart';

part 'character_provider.freezed.dart';

final characterProvider =
    StateNotifierProvider<CharacterProvider, CharacterState>(
        (ref) => CharacterProvider(ref, const CharacterState()));

class CharacterProvider extends StateNotifier<CharacterState> {
  CharacterProvider(this.ref, super.state);

  final Ref ref;


  clearData({String gender = "", String status= ""}) async{
    state = const CharacterState();
    await getCharacters(name: "", gender: gender, status: status);
  }

  Future<void> getMultipleCharacters({required Episode episode}) async {
    try {
      state = state.copyWith(pageState: const AsyncValue.loading(), multipleCharacters: []);
      final result =
      await CharacterRepository.getMultipleCharacter(characters: episode.characters.map((e) => Uri.parse(e).pathSegments.last).join(","));
      state = state.copyWith(
          multipleCharacters: result, pageState: const AsyncValue.data(null));
    } catch (e) {
      logger.e(e);
      state =
          state.copyWith(pageState: AsyncValue.error(e, StackTrace.current));
    }
  }
  Future<void> getMultipleResidents({required LocationResult location}) async {
    try {
      state = state.copyWith(pageState: const AsyncValue.loading(), residentsCharactersLocation: []);
      final result =
      await CharacterRepository.getMultipleCharacter(characters: location.residents.map((e) => Uri.parse(e).pathSegments.last).join(","));
      state = state.copyWith(
          residentsCharactersLocation: result, pageState: const AsyncValue.data(null));
    } catch (e) {
      logger.e(e);
      state =
          state.copyWith(pageState: AsyncValue.error(e, StackTrace.current));
    }
  }
  Future<void> getCharacters({ String name = "", String gender="", String status = ""}) async {
    if((state.count > 1 && state.next == null) || state.pageState.isLoading) {
      return;
    }
    try {
      state = state.copyWith(pageState: const AsyncValue.loading());
      final result = await CharacterRepository.getCharacters(
          page: state.count, name:name, gender: gender, status: status);
      state = state.copyWith(
          characters: [...state.characters, ...result.results],
          next: result.info.next,
          prev: result.info.prev,
          count:  state.count + 1 ,
          pageState: const AsyncValue.data(null));
    } catch (e) {
      logger.e(e);
      state =
          state.copyWith(pageState: AsyncValue.error(e, StackTrace.current));
    }
  }

  Future<void> refresh({ String name="", String gender="", String status = ""}) async {
    state = const CharacterState();
    await getCharacters(name: name, gender: gender, status: status);
  }
}

@freezed
class CharacterState with _$CharacterState {
  const factory CharacterState(
      {@Default(AsyncData<void>(null)) AsyncValue<void> pageState,
      @Default(null) String? next,
      @Default(null) String? prev,
      @Default(1) int count,
      @Default([]) List<Character> characters,
      @Default([]) List<Character> multipleCharacters,
      @Default([]) List<Character> residentsCharactersLocation,

      }) = _CharacterState;
}
