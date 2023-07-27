import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:rick_and_morty/config/colors.dart';
import 'package:rick_and_morty/config/images.dart';

class NotFound extends StatelessWidget {
  const NotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 100.h),
      child: Column(
        children: [
          Lottie.asset(RMAnimations.notFound,
              height: 200.h, width: 200.w),
          Text(
            "No content was found.",
            style: TextStyle(color: onBackground, fontSize: 18.sp),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
