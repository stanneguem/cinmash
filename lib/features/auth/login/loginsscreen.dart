import 'package:cinmash/app/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:cinmash/app/app_routes.dart';
import 'package:cinmash/features/auth/login/controllers.dart';

import '../../../core/utils/colors.dart';
import '../widgets/app_logo.dart';
import '../widgets/error_box.dart';
import '../widgets/errorsalert.dart';
import '../widgets/footer_text.dart';
import '../widgets/primary_button.dart';
import '../widgets/social_button.dart';
import '../widgets/text_field_custom.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final controller = Get.find<LoginControllers>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      backgroundColor: AppColors.darkColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              width: double.maxFinite,
                child: Image.asset("assets/images/fond.png", fit: BoxFit.cover,)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 45.h,),
                  const AppLogo(),
                  const SizedBox(height: 30),
                  const Text(
                    "Connexion à votre compte",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        fontFamily: "poppins"
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Text("Vous n’avez pas de compte ? ", style: TextStyle(
                          fontFamily: "poppins",
                          fontSize: 12
                      ),),
                      SizedBox(width: 5.sp,),
                      GestureDetector(
                        onTap: () {
                          Get.offNamed(AppPAges.pages[2].name);
                        },
                        child: Text(
                          "s’inscrire",
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 12,
                              fontFamily: "poppins"
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  if(controller.asError.value)...[
                    const ErrorBox(text: "Email ou mot de passe incorrect")
                  ],
                  const SizedBox(height: 20),
                  TextFieldCustom(
                    controller: _emailController,
                    hint: "example@gmail",
                    label: "Email",
                    isInvisible: false, func: () {  },
                    asError: controller.asEmailError.value,
                  ),
                  if(controller.asEmailError.value)...[
                    Errorsalert(message: controller.message.value,)
                  ],
                  const SizedBox(height: 16),
                  TextFieldCustom(
                    controller: _passwordController,
                    hint: "********",
                    label: "Mot de passe",
                    isPassword: true,
                    isInvisible: controller.passwordVisible.value, func: controller.toggleVisibility,
                    asError: controller.asPasswordError.value,
                  ),
                  if(controller.asPasswordError.value)...[
                    Errorsalert(message: controller.messagePassword.value,)
                  ],
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (_) {}),
                      const Text("Se souvenir de moi", style: TextStyle(
                          fontSize: 12,
                          fontFamily: "poppins"
                      ),),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppPAges.pages[1].name);
                        },
                        child: Text(
                          "Mot de passe oublié ?",
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 12,
                              fontFamily: "poppins"
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  PrimaryButton(isLoading: controller.isLoading.value, func: () {
                    Get.toNamed(AppName.base);
                  }, simpleText: 'Se connecter',loadingText: "Connexion en cours",),
                  const SizedBox(height: 30),
                  const Row(
                    children: [
                      Expanded(child: Divider(color: Colors.grey)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text("Ou se connecter avec", style: TextStyle(
                            fontSize: 12,
                            fontFamily: "poppins"
                        ),),
                      ),
                      Expanded(child: Divider(color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SocialButton(icon: "assets/images/google.png", label: "Google"),
                      SizedBox(width: 16),
                      SocialButton(icon: "assets/images/icons8-facebook-50.png", label: "Facebook"),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const FooterText(),
                ],
              ),
            ),
          ],
        ),
      ),
    ),);
  }
}
