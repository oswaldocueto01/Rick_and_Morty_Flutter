import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/core/routes/routes.dart';
import 'package:rick_and_morty/home/characters/logic/provider/character_provider.dart';
import 'package:rick_and_morty/home/characters/pages/character/widgets/character_item.dart';
import 'package:rick_and_morty/home/characters/pages/character/widgets/character_item_shimmer.dart';
import 'package:rick_and_morty/home/location/logic/models/location_model.dart';
import 'package:rick_and_morty/home/shared_widgets/custom_scaffold.dart';

class LocationDetails extends ConsumerStatefulWidget {
  final LocationResult location;

  const LocationDetails({super.key, required this.location});

  @override
  ConsumerState<LocationDetails> createState() => _LocationDetailsState();
}

class _LocationDetailsState extends ConsumerState<LocationDetails> {
  @override
  void initState() {
    // TODO: implement initState
    Future.microtask(() {
      ref
          .read(characterProvider.notifier)
          .getMultipleResidents(location: widget.location);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final residentsCharactersLocation =
        ref.watch(characterProvider).residentsCharactersLocation;
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
                      widget.location.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      "Name: ${widget.location.type}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      "Episode: ${widget.location.dimension}",
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
                            "Residents",
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
                    if (residentsCharactersLocation.isEmpty && !state.hasError)
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: const CharacterItemShimmer(),
                      )),
                    if (residentsCharactersLocation.isNotEmpty)
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
                                            extra: residentsCharactersLocation[
                                                index]);
                                      },
                                      child: CharacterItem(
                                          characters:
                                              residentsCharactersLocation[
                                                  index]));
                                },
                                itemCount: residentsCharactersLocation.length,
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
