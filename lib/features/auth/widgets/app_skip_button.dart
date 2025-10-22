import 'package:cinmash/features/auth/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppSkipButton extends StatelessWidget {
  const AppSkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(1.w, 1.h),
      child: SizedBox(
        width: 100.w,
          height: 45.h,
          child: PrimaryButton(isLoading: false, func: (){}, simpleText: "Sauter", loadingText: "Sauter")),
    );
  }

}
