import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/core/routes/routes.dart';
import 'package:rick_and_morty/home/characters/logic/models/character_model.dart';
import 'package:rick_and_morty/home/shared_widgets/item_episodes.dart';
import 'package:rick_and_morty/home/episodes/logic/provider/episode_provider.dart';
import 'package:rick_and_morty/home/shared_widgets/custom_scaffold.dart';
import 'package:rick_and_morty/home/shared_widgets/shimmer_list.dart';
import 'package:shimmer/shimmer.dart';

class CharacterDetailsPage extends ConsumerStatefulWidget {
  final Character character;

  const CharacterDetailsPage({super.key, required this.character});

  @override
  ConsumerState<CharacterDetailsPage> createState() =>
      _CharacterDetailsPageState();
}

class _CharacterDetailsPageState extends ConsumerState<CharacterDetailsPage> {
  @override
  void initState() {
    // TODO: implement initState
    Future.microtask(() {
      ref
          .read(episodeProvider.notifier)
          .getMultipleEpisodes(character: widget.character);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final multipleEpisodes = ref.watch(episodeProvider).multipleEpisodes;
    final state = ref.watch(episodeProvider).pageState;
    return CustomScaffold(
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CachedNetworkImage(
                      imageUrl: widget.character.image,
                      imageBuilder: (context, imageProvider) => Container(
                        height: 0.4.sh,
                        width: 1.sw,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.white.withOpacity(0.5),
                        highlightColor: Colors.grey.withOpacity(0.2),
                        child: Container(
                          width: 1.sw,
                          height: 0.5.sh,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2)),
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
                    Positioned(
                        bottom: 10.h,
                        left: 10.w,
                        child: Row(
                          children: [
                            Container(
                              height: 20.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                  color: widget.character.status == "Alive"
                                      ? Colors.green
                                      : widget.character.status == "unknown"
                                          ? Colors.blueAccent
                                          : Colors.redAccent,
                                  shape: BoxShape.circle),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              widget.character.status,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(
                                      offset: Offset(0.1, 0.3),
                                      blurRadius: 3.0,
                                      color: Colors.black,
                                    ),
                                  ]),
                            )
                          ],
                        )),
                    Positioned(
                        bottom: 10.h,
                        right: 10.w,
                        child: Row(
                          children: [
                            Text(
                              widget.character.gender,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(
                                      offset: Offset(0.1, 0.3),
                                      blurRadius: 3.0,
                                      color: Colors.black,
                                    ),
                                  ]),
                            )
                          ],
                        )),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Column(
                          children: [
                            Text(
                              "Name",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.sp,
                              ),
                            ),
                            Text(
                              widget.character.name,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.sp,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Column(
                          children: [
                            Text(
                              "Origin",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.sp,
                              ),
                            ),
                            Text(
                              widget.character.origin.name,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.sp,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.white.withAlpha(70),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Episodes",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                if (multipleEpisodes.isEmpty && !state.hasError)
                  Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: ListView.builder(
                            itemBuilder: (context, index) => Padding(
                                  padding: EdgeInsets.only(bottom: 7.h),
                                  child: const ShimmerList(),
                                ),
                            itemCount: 8),
                      )),
                if (multipleEpisodes.isNotEmpty)
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: EdgeInsets.only(bottom: 7.h),
                                child: GestureDetector(
                                  onTap: () {
                                    context.pushNamed(
                                        RAndMRoutesNames.episodeDetails.name,
                                        extra: multipleEpisodes[index]);
                                  },
                                  child: ItemEpisodes(
                                    episode: multipleEpisodes[index],
                                  ),
                                ));
                          },
                          itemCount: multipleEpisodes.length),
                    ),
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
