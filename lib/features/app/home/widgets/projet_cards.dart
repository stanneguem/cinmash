import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/colors.dart';

class ProjetCards extends StatelessWidget {
  const ProjetCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260.w,
      color: AppColors.secondDarkColor,
      margin: EdgeInsets.all(12),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topRight,
            height: 125.h,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/fond.png"), fit: BoxFit.cover)
            ),
            child: IconButton(onPressed: (){}, icon: Icon(Icons.favorite)),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 20,
                          backgroundImage: AssetImage("assets/images/personnages.png"),
                        ),
                        SizedBox(width: 10.w,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Gabriel", style: TextStyle(
                                fontFamily: "poppins",
                                fontSize: 12.sp,
                                color: AppColors.lightColor
                            ),),
                            Container(
                              decoration: BoxDecoration(
                                  color: AppColors.darkColor,
                                  borderRadius: BorderRadius.circular(4.r)
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              child: Text("Level 2", style: TextStyle(
                                  fontFamily: "poppins",
                                  fontSize: 9.sp,
                                  color: AppColors.greyColor
                              ),),
                            )
                          ],
                        ),
                        SizedBox(width: 10.w,),
                        Icon(Icons.verified, color: Colors.blue,size: 15.w,)
                      ],
                    ),
                    IconButton(onPressed: (){}, icon: Icon(Icons.favorite))
                  ],
                ),
                SizedBox(
                  height: 36.h,
                  width: double.maxFinite,
                  child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: "poppins",
                        color: AppColors.greyColor,
                        fontSize: 10.sp
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.white,),
                        SizedBox(width: 4.w,),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          decoration: BoxDecoration(
                              color: AppColors.darkColor,
                              borderRadius: BorderRadius.circular(4.r)
                          ),
                          child: Text("4.6", style: TextStyle(
                              fontFamily: "poppins",
                              fontSize: 10.sp,
                              color: AppColors.lightColor
                          )),
                        ),
                        SizedBox(width: 4.w,),
                        Text("(1K)", style: TextStyle(
                            fontFamily: "poppins",
                            fontSize: 10.sp,
                            color: AppColors.greyColor
                        ),)
                      ],
                    ),
                    Row(
                      children: [
                        Text("Doc", style: TextStyle(
                            fontFamily: "poppins",
                            fontSize: 10.sp,
                            color: AppColors.greyColor,
                        ),
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        SizedBox(width: 5.w,),
                        Container(
                          color: AppColors.darkColor,
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: Text("En Cours", style: TextStyle(
                            fontFamily: "poppins",
                            fontSize: 10.sp,
                            color: AppColors.succesColor,
                          ),
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
