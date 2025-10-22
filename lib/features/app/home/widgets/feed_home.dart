import 'package:cinmash/features/app/home/widgets/projet_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeedHome extends StatelessWidget {
  const FeedHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 2450.h,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: 10,
          itemBuilder: (context, index) {
            return ProjetCards();
          },
      ),
    );
  }
}
