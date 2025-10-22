import 'package:cinmash/core/utils/colors.dart';
import 'package:cinmash/features/app/discover/widgets/projects_list.dart';
import 'package:cinmash/features/app/discover/widgets/ressource_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.secondDarkColor,
            bottom: PreferredSize(
                preferredSize: Size(1, 1),
                child: TabBar(
                  labelStyle: TextStyle(
                    fontFamily: "poppins",
                    fontSize: 14.sp,
                    color: AppColors.primaryColor
                  ),
                    indicatorColor: AppColors.primaryColor,
                    unselectedLabelColor: AppColors.greyColor,
                    dividerColor: AppColors.secondDarkColor,
                    tabs: [
                      Tab(
                        child: Text("Projects"),
                      ),
                      Tab(child: Text("Ressources"),),
                    ],
                )
            ),
          ),
          body: TabBarView(
              children: [
                ProjectsList(),
                RessourceList(),
              ]
          ),
        )
    );
  }
}
