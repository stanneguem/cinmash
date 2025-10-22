import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/colors.dart';

class TextFieldCustom extends StatelessWidget {
  final String label;
  final String hint;
  final bool isPassword;
  final bool isInvisible;
  final bool asError;
  final TextEditingController controller;
  final Function() func;

  const TextFieldCustom({
    super.key,
    required this.label,
    required this.hint,
    this.isPassword = false, required this.controller, required this.isInvisible, required this.func, required this.asError
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(
          fontFamily: "poppins",
          fontSize: 12
        ),),
        const SizedBox(height: 6),
        Container(
          alignment: Alignment.center,
          height: 46.sp,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.secondDarkColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: asError ? AppColors.errorColor : AppColors.darkColor)
          ),
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  onTap: func,
                  obscureText: isInvisible,
                  controller: controller,
                  style: TextStyle(
                    fontFamily: "poppins",
                    fontSize: 12.sp,
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: TextStyle(
                      fontFamily: "poppins",
                      fontSize: 12.sp,
                      color: Colors.grey.shade500,
                    ),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                    isDense: true,
                    filled: false,
                  ),
                ),
              ),
              if (isPassword) ...[
                IconButton(
                  onPressed: func,
                  icon: Icon(
                    isInvisible ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey.shade500,
                    size: 18.sp,
                  ),
                ),
              ],
            ],
          ),
        )
      ],
    );
  }
}
