import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/colors.dart';

class TextArea extends StatelessWidget {
  final String label;
  final String hint;
  final bool asError;
  final TextEditingController controller;
  final Function() func;

  const TextArea({
    super.key,
    required this.label,
    required this.hint,
    required this.controller, required this.func, required this.asError
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
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColors.secondDarkColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: asError ? AppColors.errorColor : AppColors.darkColor)
          ),
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  maxLines: 7,
                  onTap: func,
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
              IconButton(
                onPressed: func,
                icon: Icon(
                  Icons.edit,
                  color: Colors.grey.shade500,
                  size: 18.sp,
                ),
              ),

            ],
          ),
        )
      ],
    );
  }
}
