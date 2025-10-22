import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/colors.dart';

class SocialButton extends StatelessWidget {
  final String icon;
  final String label;

  const SocialButton({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: AppColors.secondDarkColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white.withOpacity(0.2))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(icon, width: 20.w, height: 20.h,),
            const SizedBox(width: 8),
            Text(label, style: const TextStyle(color: Colors.white, fontFamily: "poppins", fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
