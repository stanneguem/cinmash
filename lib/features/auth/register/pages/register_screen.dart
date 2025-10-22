import 'package:cinmash/app/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:cinmash/core/utils/colors.dart';
import 'package:cinmash/features/auth/register/controllers/register_controller.dart';
import 'package:cinmash/features/auth/register/widgets/register_error_box.dart';
import '../../widgets/app_back_button.dart';
import '../../widgets/dropdown_custom.dart';
import '../../widgets/footer_text.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/social_button.dart';
import '../../widgets/text_field_custom.dart';
import 'package:country_picker/country_picker.dart';

class RegisterScreen extends StatelessWidget {

  RegisterScreen({super.key});
  final controller = Get.put(RegisterController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => SingleChildScrollView(
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
                  SizedBox(height: 55.h,),
                  const SizedBox(height: 24),
                  Text("S’inscrire",
                      style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: "poppins")),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Text("Vous avez déjà un compte ? ",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12.sp,
                              fontFamily: "poppins"
                          )),
                      GestureDetector(
                        onTap: (){
                          Get.offNamed(AppPAges.pages[0].name);
                        },
                        child: Text("Se connecter",
                            style: TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontFamily: "poppins",
                                fontSize: 12.sp
                            )),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  RegisterErrorBox(errors: controller.errors),
                  SizedBox(height: 14.h),
                  TextFieldCustom(
                    label: 'Email',
                    asError: false,
                    func: (){},
                    controller: controller.email,
                    hint: "Email",
                    isInvisible: false,
                    isPassword: false,
                  ),
                  SizedBox(height: 14.h),
                  TextFieldCustom(
                    label: 'Mot de passe',
                    asError: false,
                    func: controller.changePasswordVisible,
                    controller: controller.password,
                    hint: "******",
                    isInvisible: controller.isPasswordInvisible.value,
                    isPassword: true,
                  ),
                  SizedBox(height: 14.h),
                  TextFieldCustom(
                    label: 'Confirmer le mot de passe',
                    asError: false,
                    func: controller.changeConfirmPasswordVisible,
                    controller: controller.confirmPassword,
                    hint: "******",
                    isInvisible: controller.isConfirmPasswordInvisible.value,
                    isPassword: true,
                  ),
                  SizedBox(height: 20.h),
                  PrimaryButton(isLoading: false,func: controller.register, simpleText: 'S\'inscrire',loadingText: "Inscription....",),
                  SizedBox(height: 30.h),
                  const Row(
                    children: [
                      Expanded(child: Divider(color: Colors.grey)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text("Ou continuer avec", style: TextStyle(
                            fontSize: 12,
                            fontFamily: "poppins"
                        ),),
                      ),
                      Expanded(child: Divider(color: Colors.grey)),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SocialButton(icon: "assets/images/google.png", label: "Google"),
                      SizedBox(width: 16),
                      SocialButton(icon: "assets/images/icons8-facebook-50.png", label: "Facebook"),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  const FooterText(),
                ],
              ),
            ),
          ],
        ),
      ),),
    );
  }
}
