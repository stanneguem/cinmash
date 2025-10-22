import 'package:cinmash/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Create extends StatelessWidget {
  const Create({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          children: [
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
                    Text("Partager une idee", style: TextStyle(
                      fontFamily: "poppins",
                      fontSize: 14.sp
                    ),),
                    Icon(Icons.satellite_alt)
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
                    Text("Partager une ressource", style: TextStyle(
                      fontFamily: "poppins",
                      fontSize: 14.sp
                    ),),
                    Icon(Icons.library_add)
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
