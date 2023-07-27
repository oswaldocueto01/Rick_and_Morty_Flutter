import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/core/utils/logger.dart';
import 'package:rick_and_morty/home/characters/logic/models/character_model.dart';
import 'package:rick_and_morty/home/characters/logic/repository/character_repository.dart';
import 'package:rick_and_morty/home/episodes/logic/models/episode_model.dart';
import 'package:rick_and_morty/home/episodes/logic/repository/episode_repository.dart';

part 'episode_provider.freezed.dart';

final episodeProvider = StateNotifierProvider<EpisodeProvider, EpisodeState>(
    (ref) => EpisodeProvider(ref, const EpisodeState()));

class EpisodeProvider extends StateNotifier<EpisodeState> {
  EpisodeProvider(this.ref, super.state);

  final Ref ref;

  clearData() async {
    state = const EpisodeState();
    await getEpisodes(name: "");
  }

  Future<void> getMultipleEpisodes({required Character character}) async {
    try {
      state = state
          .copyWith(pageState: const AsyncValue.loading(), multipleEpisodes: []);
      final result = await EpisodeRepository.getMultipleEpisode(
          episodes: character.episode
              .map((e) => Uri.parse(e).pathSegments.last)
              .join(","));
      state = state.copyWith(
          multipleEpisodes: result, pageState: const AsyncValue.data(null));
    } catch (e) {
      logger.e(e);
      state =
          state.copyWith(pageState: AsyncValue.error(e, StackTrace.current));
    }
  }

  Future<void> getEpisodes({required String name}) async {
    if ((state.count > 1 && state.next == null) || state.pageState.isLoading) {
      return;
    }
    try {
      state = state.copyWith(pageState: const AsyncValue.loading());
      final result = await EpisodeRepository.getEpisode(page: 1, name: name);
      state = state.copyWith(
          episodes: [...state.episodes, ...result.results],
          next: result.info.next,
          prev: result.info.prev,
          count: state.count + 1,
          pageState: const AsyncValue.data(null));
    } catch (e) {
      logger.e(e);
      state =
          state.copyWith(pageState: AsyncValue.error(e, StackTrace.current));
    }
  }

  Future<void> refresh({required String name}) async {
    state = const EpisodeState();
    await getEpisodes(name: name);
  }
}

@freezed
class EpisodeState with _$EpisodeState {
  const factory EpisodeState({
    @Default(AsyncData<void>(null)) AsyncValue<void> pageState,
    @Default(null) String? next,
    @Default(null) String? prev,
    @Default(1) int count,
    @Default([]) List<Episode> multipleEpisodes,
    @Default([]) List<Episode> episodes,
  }) = _EpisodeState;
}
