import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/colors.dart';

class Errorsalert extends StatelessWidget {
  final String message;
  const Errorsalert({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      child: Row(
        children: [
          Icon(Icons.warning, color: AppColors.errorColor,size: 12,),
          SizedBox(width: 5.w,),
          Text(message, style: TextStyle(
              fontFamily: "poppins",
              fontSize: 12,
              color: AppColors.errorColor
          ),),
        ],
      ),
    );
  }
}
