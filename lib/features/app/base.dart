import 'package:cinmash/app/route_names.dart';
import 'package:cinmash/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'avalable/avalable.dart';
import 'create/create.dart';
import 'discover/Discover_screen.dart';
import 'home/home_page.dart';
import 'mescreen.dart';

class Base extends StatefulWidget {
  const Base({super.key});

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  int _currentIndex = 0;
  List<Widget> page =[
    HomePage(),
    DiscoverScreen(),
    Create(),
    Avalable(),
    Mescreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondDarkColor,
        leading: Padding(
          padding: EdgeInsets.only(left: 5.w),
          child: Image.asset("assets/logos/luncher.jpeg"),
        ),
        actions: [
          // Icon(Icons.update),
          IconButton(onPressed: (){
            Get.toNamed(AppName.messages);
          }, icon: Icon(Icons.mail, color: AppColors.greyColor,)),
          if(_currentIndex == 1) ...[
            IconButton(onPressed: (){}, icon: Icon(Icons.search, color: AppColors.greyColor,))
          ],
          IconButton(onPressed: (){
            Get.toNamed(AppName.notification);
          }, icon: Icon(Icons.notifications, color: AppColors.greyColor,)),
        ],
      ),
      body: page[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.secondDarkColor,
        type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: AppColors.greyColor,
          currentIndex: _currentIndex,
          onTap: (value){
          setState(() {
            _currentIndex = value;
          });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),
              label: "home"
            ),
            BottomNavigationBarItem(icon: Icon(Icons.explore),
              label: "Discover"
            ),
            BottomNavigationBarItem(icon: Icon(Icons.post_add),
              label: "Create"
            ),
            BottomNavigationBarItem(icon: Icon(Icons.tv),
              label: "Available"
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person),
              label: "Me"
            ),
          ]
      ),
      floatingActionButton: _currentIndex == 3 ? FloatingActionButton(
          onPressed: (){},
        backgroundColor: AppColors.secondDarkColor,
        child: Icon(Icons.edit, color: AppColors.primaryColor,),
      ) : null,
    );
  }
}
