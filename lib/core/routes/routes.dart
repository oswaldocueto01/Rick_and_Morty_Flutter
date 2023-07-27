import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/home/characters/logic/models/character_model.dart';
import 'package:rick_and_morty/home/characters/pages/character_details/character_details_page.dart';
import 'package:rick_and_morty/home/episodes/logic/models/episode_model.dart';
import 'package:rick_and_morty/home/episodes/pages/episode_details/episode_deteails.dart';
import 'package:rick_and_morty/home/home_page.dart';
import 'package:rick_and_morty/home/location/logic/models/location_model.dart';
import 'package:rick_and_morty/home/location/pages/location_details/locations_detail.dart';
import 'package:rick_and_morty/home/location/pages/locations/locations_page.dart';

class RAndMRoutesNames {
  static final RouteData characterDetails =
      RouteData(name: 'character_details', path: 'character_details');
  static final RouteData localizationDetails =
      RouteData(name: 'localization_detail', path: 'localization_detail');
  static final RouteData episodeDetails =
      RouteData(name: 'episode_details', path: 'episode_details');
}

class RouteData {
  ///Data of the route
  RouteData({required this.name, required this.path});

  final String name;
  final String path;
}

class RickAndMortyRouter {
  static GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
          path: "/",
          name: "/",
          builder: (context, state) => HomePage(
                key: state.pageKey,
              ),
          routes: [
            GoRoute(
                path: "character_details",
                name: "character_details",
                builder: (context, state) {
                  final character = state.extra as Character;
                  return CharacterDetailsPage(
                    character: character,
                    key: state.pageKey,
                  );
                },),
            GoRoute(
              path: "episode_details",
              name: "episode_details",
              builder: (context, state) {
                final episode = state.extra as Episode;
                return EpisodeDetails(
                  episode: episode,
                  key: state.pageKey,
                );
              },),
            GoRoute(
              path: "localization_detail",
              name: "localization_detail",
              builder: (context, state) {
                final location = state.extra as LocationResult;
                return LocationDetails(
                  location: location,
                  key: state.pageKey,
                );
              },),
          ]),
    ],
  );

  CustomTransitionPage buildPageWithDefaultTransition<T>({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
  }) {
    return CustomTransitionPage<T>(
        key: state.pageKey,
        child: child,
        transitionDuration: const Duration(milliseconds: 200),
        transitionsBuilder: (context, animation, secondaryAnimation, child2) {
          return SlideTransition(
            position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
                .animate(animation),
            child: child,
          );
        });
  }
}
