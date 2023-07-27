import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/config/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final GestureTapCallback? onTap;
  final ValueChanged<String>? onChanged;
  final bool? autofocus;
  final Widget? suffixIcon;
  final String? hintText;



  const CustomTextField(
      {super.key,
      this.textEditingController,
      this.onTap,
      this.onChanged,
      this.autofocus, this.suffixIcon, this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      width: 1.sw,
      decoration: BoxDecoration(
          color: onBackground, borderRadius: BorderRadius.circular(7.r)),
      child: TextField(
        controller: textEditingController,
        onTap: onTap,
        onChanged: onChanged,
        autofocus: autofocus ?? false,
        style: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.bold
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 3.h, left: 12.w),
            suffixIcon: suffixIcon,
            hintText: hintText,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7.r),
                borderSide: BorderSide.none)),
      ),
    );
  }
}
