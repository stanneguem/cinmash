import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.h,
      width: 45.w,
      child: Image.asset("assets/logos/luncher.jpeg"),
    );
  }
}
