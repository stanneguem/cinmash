import 'package:cinmash/features/app/home/widgets/ads_section.dart';
import 'package:cinmash/features/app/home/widgets/best_product_section.dart';
import 'package:cinmash/features/app/home/widgets/feed_home.dart';
import 'package:cinmash/features/app/home/widgets/head_section.dart';
import 'package:cinmash/features/app/home/widgets/most_wanted_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await  Future.delayed(Duration(milliseconds: 500));
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeadSection(),
              MostWantedSection(),
              AdsSection(),
              SizedBox(height: 15.h,),
              BestRessourcesSection(),
              AdsSection(),
              SizedBox(height: 15.h,),
              FeedHome()
            ],
          ),
        ),
      ),
    );
  }
}
