import 'package:cinmash/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeadSection extends StatelessWidget {
  const HeadSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 65.h,
      color: AppColors.darkColor,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          color: AppColors.secondDarkColor
        ),
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 15.h),
        child: TextField(
          style: TextStyle(
            fontFamily: "poppins",
            fontSize: 12.sp,
            color: Colors.white,
          ),
          decoration: InputDecoration(
            filled: false,
            hintText: "Search projects or ressources",
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            contentPadding: EdgeInsets.zero,
            isDense: true,
              hintStyle: TextStyle(
                fontFamily: "poppins",
                fontSize: 12.sp,
                color: Colors.grey.shade500,
              ),
            prefixIcon: Icon(Icons.search, size: 25.w, color: AppColors.greyColor,)
          ),
          // enabled: false,
        ),
      ),
    );
  }
}
