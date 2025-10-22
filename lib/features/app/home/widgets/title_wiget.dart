import 'package:cinmash/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleWidget extends StatelessWidget {
  final String texte;
  const TitleWidget({super.key, required this.texte});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 200.w,
            child: Text(texte, style: TextStyle(
              fontFamily: "poppins",
              fontWeight: FontWeight.bold,
              fontSize: 12.sp,
              color: AppColors.primaryColor
            ),),
          ),
          TextButton(onPressed: (){}, child: Text("See more", style: TextStyle(
            fontSize: 10.sp,
            fontFamily: "poppins",
            color: AppColors.greyColor
          ),))
        ],
      ),
    );
  }
}
