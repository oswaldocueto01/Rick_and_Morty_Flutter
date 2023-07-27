import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/core/utils/logger.dart';
import 'package:rick_and_morty/home/location/logic/models/location_model.dart';
import 'package:rick_and_morty/home/location/logic/repository/location_repository.dart';

part 'location_provider.freezed.dart';

final locationProvider =
    StateNotifierProvider<LocationProvider, LocationState>(
        (ref) => LocationProvider(ref, const LocationState()));

class LocationProvider extends StateNotifier<LocationState> {
  LocationProvider(this.ref, super.state);

  final Ref ref;

  clearData() async {
    state = const LocationState();
    await getLocations(name: "");
  }

  Future<void> getLocations({required String name}) async {
    if ((state.count > 1 && state.next == null) || state.pageState.isLoading) {
      return;
    }
    try {
      state = state.copyWith(pageState: const AsyncValue.loading());
      final result = await LocationRepository.getLocation(page: 1, name: name);
      state = state.copyWith(
          locations: [...state.locations, ...result.results],
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
    state = const LocationState();
    await getLocations(name: name);
  }
}

@freezed
class LocationState with _$LocationState {
  const factory LocationState({
    @Default(AsyncData<void>(null)) AsyncValue<void> pageState,
    @Default(null) String? next,
    @Default(null) String? prev,
    @Default(1) int count,
    @Default([]) List<LocationResult> locations,
  }) = _LocationState;
}
