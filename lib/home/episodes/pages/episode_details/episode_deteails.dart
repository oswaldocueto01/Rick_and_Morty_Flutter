import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/core/routes/routes.dart';
import 'package:rick_and_morty/home/characters/logic/provider/character_provider.dart';
import 'package:rick_and_morty/home/characters/pages/character/widgets/character_item.dart';
import 'package:rick_and_morty/home/characters/pages/character/widgets/character_item_shimmer.dart';
import 'package:rick_and_morty/home/episodes/logic/models/episode_model.dart';
import 'package:rick_and_morty/home/shared_widgets/custom_scaffold.dart';

class EpisodeDetails extends ConsumerStatefulWidget {
  final Episode episode;

  const EpisodeDetails({super.key, required this.episode});

  @override
  ConsumerState<EpisodeDetails> createState() => _EpisodeDetailsState();
}

class _EpisodeDetailsState extends ConsumerState<EpisodeDetails> {
  @override
  void initState() {
    // TODO: implement initState
    Future.microtask(() {
      ref
          .read(characterProvider.notifier)
          .getMultipleCharacters(episode: widget.episode);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final multipleCharacter = ref.watch(characterProvider).multipleCharacters;
    final state = ref.watch(characterProvider).pageState;
    return CustomScaffold(
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            SizedBox(
              height: 1.sh,
              width: 1.sw,
              child: Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.episode.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      "Air Date: ${widget.episode.airDate}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      "Episode: ${widget.episode.episode}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Characters",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    if (multipleCharacter.isEmpty && !state.hasError)
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: const CharacterItemShimmer(),
                      )),
                    if (multipleCharacter.isNotEmpty)
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: CustomScrollView(
                            slivers: [
                              SliverGrid.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisSpacing: 12,
                                        crossAxisCount: 2),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                      onTap: () {
                                        context.pushNamed(
                                            RAndMRoutesNames
                                                .characterDetails.name,
                                            extra: multipleCharacter[index]);
                                      },
                                      child: CharacterItem(
                                          characters:
                                              multipleCharacter[index]));
                                },
                                itemCount: multipleCharacter.length,
                              )
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 10.h,
              left: 10.w,
              child: GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: Container(
                  height: 40.h,
                  width: 40.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.black.withAlpha(
                        20,
                      ),
                      shape: BoxShape.circle),
                  child: Padding(
                    padding: EdgeInsets.only(right: 3.w),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
