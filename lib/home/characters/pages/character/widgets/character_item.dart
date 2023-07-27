import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/home/characters/logic/models/character_model.dart';
import 'package:shimmer/shimmer.dart';

class CharacterItem extends StatelessWidget {
  final Character characters;

  const CharacterItem({super.key, required this.characters});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: Container(
        width: 1.sw,
        decoration: BoxDecoration(
            color: Colors.white.withAlpha(20),
            borderRadius: BorderRadius.circular(12.r)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                characters.name,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 2.h,
              ),
              Expanded(
                child: CachedNetworkImage(
                  imageUrl: characters.image,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.white.withOpacity(0.5),
                    highlightColor: Colors.grey.withOpacity(0.2),
                    child: Container(
                      decoration:
                          BoxDecoration(color: Colors.white.withOpacity(0.2)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Row(
                children: [
                  Text(
                    characters.species,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  Container(
                    height: 10.h,
                    width: 10.w,
                    decoration: BoxDecoration(
                        color: characters.status == "Alive"
                            ? Colors.green
                            : characters.status == "unknown"
                                ? Colors.blueAccent
                                : Colors.redAccent,
                        shape: BoxShape.circle),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
