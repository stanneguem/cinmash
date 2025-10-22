import 'package:cinmash/app/route_names.dart';
import 'package:get/get.dart';
import 'package:cinmash/features/index.dart';

class AppPAges{
  static final pages = [
    GetPage(
      name: AppName.login,
      page: () => LoginPage(),
    ),
    GetPage(
      name: AppName.forgotPassword,
      page: () => ResetPasswordPage(),
    ),
    GetPage(
      name: AppName.register,
      page: () => RegisterScreen(),
    ),
    GetPage(
      name: AppName.registerPersonnalInformations,
      page: () => Personnalinformations(),
    ),
    GetPage(
      name: AppName.registerProfessionaInformations,
      page: () => ProfeessionalInformations(),
    ),
    GetPage(
      name: AppName.registerImage,
      page: () => ProfileImage(),
    ),
    GetPage(
      name: AppName.base,
      page: () => Base(),
    ),
    GetPage(
      name: AppName.notification,
      page: () => Notifiactionscreen(),
    ),
    GetPage(
      name: AppName.messages,
      page: () => MessagesPage(),
    ),
  ];
}