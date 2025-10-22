import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/colors.dart';

class Mescreen extends StatelessWidget {
  const Mescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: ListView(
          children: [
            SizedBox(height: 5.h,),
            GestureDetector(
              onTap: (){},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                width: double.maxFinite,
                height: 50.h,
                decoration: BoxDecoration(
                    color: AppColors.secondDarkColor
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Profil", style: TextStyle(
                        fontFamily: "poppins",
                        fontSize: 14.sp
                    ),),
                    Icon(Icons.navigate_next)
                  ],
                ),
              ),
            ),
            SizedBox(height: 15.h,),
            GestureDetector(
              onTap: (){},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                width: double.maxFinite,
                height: 50.h,
                decoration: BoxDecoration(
                    color: AppColors.secondDarkColor
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Parametres", style: TextStyle(
                        fontFamily: "poppins",
                        fontSize: 14.sp
                    ),),
                    Icon(Icons.navigate_next)
                  ],
                ),
              ),
            ),
            SizedBox(height: 15.h,),
            GestureDetector(
              onTap: (){},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                width: double.maxFinite,
                height: 50.h,
                decoration: BoxDecoration(
                    color: AppColors.secondDarkColor
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Aide", style: TextStyle(
                        fontFamily: "poppins",
                        fontSize: 14.sp
                    ),),
                    Icon(Icons.navigate_next)
                  ],
                ),
              ),
            ),
            SizedBox(height: 15.h,),
            GestureDetector(
              onTap: (){},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                width: double.maxFinite,
                height: 50.h,
                decoration: BoxDecoration(
                    color: AppColors.secondDarkColor
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Deconnexion", style: TextStyle(
                        fontFamily: "poppins",
                        fontSize: 14.sp
                    ),),
                    Icon(Icons.navigate_next)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
