import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'app/app_routes.dart';
import 'app/app_themes.dart';
import 'app/route_names.dart';
import 'features/auth/login/controllers.dart';
import 'features/auth/register/controllers/personnal_data_controller.dart';
import 'features/auth/register/controllers/register_controller.dart';

void main() {
  Get.put(LoginControllers());
  Get.put(PersonnalDataController());
  Get.put(RegisterController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Cinmash',
          theme: AppTheme.darkTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.system,
          debugShowCheckedModeBanner: false,
          initialRoute: AppName.login,
          getPages: AppPAges.pages,
        );
      },
    );
  }
}
