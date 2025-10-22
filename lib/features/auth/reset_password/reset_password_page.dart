import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:cinmash/app/app_routes.dart';
import '../../../core/utils/colors.dart';
import '../widgets/app_back_button.dart';
import '../widgets/text_field_custom.dart';
import '../widgets/primary_button.dart';
import '../widgets/footer_text.dart';

class ResetPasswordPage extends StatelessWidget {
  ResetPasswordPage({super.key});
  final _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                    const AppBackButton(),
                    const SizedBox(height: 24),
                    Text(
                      "Réinitialiser le mot de passe",
                      style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w700, fontFamily: "poppins"),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Text("Vous avez déjà un compte ? ", style: TextStyle(
                          fontFamily: "poppins",
                          fontSize: 12.sp
                        ),),
                        GestureDetector(
                          onTap: () {
                            Get.offNamed(AppPAges.pages[0].name);
                          },
                          child: Text(
                            " Se connecter",
                            style: TextStyle(
                                color: AppColors.primaryColor,
                              fontSize: 12.sp,
                              fontFamily: "poppins"
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Text(
                      "Un lien de réinitialisation du mot de passe sera envoyé à l’adresse email ci-dessous.",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.sp,
                        fontFamily: "poppins"
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFieldCustom(
                      label: "Email",
                      hint: "example@gmail",
                      controller: _email,
                      isInvisible: false,
                      func: (){},
                      isPassword: false,
                      asError: false,
                    ),
                    const SizedBox(height: 30),
                    PrimaryButton(isLoading: false, func: () {  }, simpleText: 'Envoyer',loadingText: "Envoie en cours...",),
                    const SizedBox(height: 40),
                    const FooterText(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
