import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cinmash/core/utils/colors.dart';
import '../../widgets/dropdown_custom.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/text_field_custom.dart';
import 'register_error_box.dart';

class RegisterForm extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController paysController;
  final TextEditingController passwordController;
  final TextEditingController confirmController;
  final List<String> errors;
  final VoidCallback onSubmit;

  const RegisterForm({
    super.key,
    required this.nameController,
    required this.lastNameController,
    required this.emailController,
    required this.paysController,
    required this.passwordController,
    required this.confirmController,
    required this.errors,
    required this.onSubmit,
  });

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {

  String flag = "";

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
      children: [
        RegisterErrorBox(errors: widget.errors),
        Row(
          children: [
            Expanded(
                child: TextFieldCustom(
                  label: 'Nom',
                  asError: false,
                  func: (){},
                  controller: widget.nameController,
                  hint: "Nom",
                  isInvisible: false,
                  isPassword: false,
                )),
            const SizedBox(width: 10),
            Expanded(child: TextFieldCustom(
              label: 'Prénom',
              asError: false,
              func: (){},
              controller: widget.lastNameController,
              hint: "Prénom",
              isInvisible: false,
              isPassword: false,
            )),
          ],
        ),
        const SizedBox(height: 14),
        TextFieldCustom(
          label: 'Email',
          asError: false,
          func: (){},
          controller: widget.emailController,
          hint: "Email",
          isInvisible: false,
          isPassword: false,
        ),
        const SizedBox(height: 14),
        DropdownCustom(
          label: 'Pays',
          asError: false,
          flag: flag,
          func: (){
            showCountryPicker(
              context: context,
              countryListTheme: CountryListThemeData(
                flagSize: 25,
                backgroundColor: AppColors.darkColor,
                textStyle: TextStyle(fontSize: 16, color: AppColors.lightColor, fontFamily: "poppins"),
                bottomSheetHeight: 500, // Optional. Country list modal height
                //Optional. Sets the border radius for the bottomsheet.
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                //Optional. Styles the search field.
                inputDecoration: InputDecoration(
                  labelText: 'Search',
                  hintText: 'Start typing to search',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color(0xFF8C98A8).withOpacity(0.2),
                    ),
                  ),
                ),
              ),
              onSelect: (Country country){
                widget.paysController.text = country.name;
                flag = country.flagEmoji;
                setState(() {});
              },
            );
          },
          controller: widget.paysController,
          hint: "Cameroun",
          isInvisible: false,
          isReadOnly: true,
        ),
        const SizedBox(height: 14),
        TextFieldCustom(
          label: 'Mot de passe',
          asError: false,
          func: (){},
          controller: widget.passwordController,
          hint: "Mot de passe",
          isInvisible: false,
          isPassword: true,
        ),
        const SizedBox(height: 14),
        TextFieldCustom(
          label: 'Confirmer le mot de passe',
          asError: false,
          func: (){},
          controller: widget.confirmController,
          hint: "Confirmer le mot de passe",
          isInvisible: false,
          isPassword: true,
        ),
        const SizedBox(height: 20),
        PrimaryButton(isLoading: false,func: (){}, simpleText: 'S\'incrire',loadingText: "Inscription",)
      ],
    ),);
  }
}
