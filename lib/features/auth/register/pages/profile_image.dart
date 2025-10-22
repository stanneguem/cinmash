import 'package:cinmash/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../app/app_routes.dart';
import '../../widgets/footer_text.dart';
import '../../widgets/primary_button.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
                width: double.maxFinite,
                child: Image.asset("assets/images/fond.png", fit: BoxFit.cover,)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 115.h,),
                  Text("Photo de profil",
                      style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: "poppins")),
                  SizedBox(height: 8.h),
                  Text("Votre photo de profil est l'image qui va etre presenter sur votre page professionel",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.sp,
                          fontFamily: "poppins"
                      )),
                  SizedBox(height: 14.h),
                  Container(
                    alignment: Alignment.center,
                    height: 150.h,
                    width: 150.w,
                    decoration: BoxDecoration(
                      color: AppColors.secondDarkColor,
                      shape: BoxShape.circle,
                      image: DecorationImage(image: AssetImage("assets/images/personnages.png"), fit: BoxFit.cover)
                    ),
                    child: Stack(
                      children: [
                        Container(
                          height: 150.h,
                          width: 150.w,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.6),
                              shape: BoxShape.circle,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.secondDarkColor,
                            shape: BoxShape.circle
                          ),
                          child: IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  PrimaryButton(isLoading: false,func: (){Get.toNamed(AppPAges.pages[5].name);}, simpleText: 'Continuer',loadingText: "Enregistrement...",),
                  const SizedBox(height: 30),
                  const FooterText(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
