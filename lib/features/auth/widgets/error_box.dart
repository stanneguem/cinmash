import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';

class ErrorBox extends StatelessWidget {
  final String text;
  const ErrorBox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.errorColorBg,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset("assets/images/Vector.png"),
          const SizedBox(width: 8),
          Text(text, style: TextStyle(
              color: AppColors.errorColor,
            fontFamily: "poppins",
            fontSize: 14
          )),
        ],
      ),
    );
  }
}
