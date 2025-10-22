import 'package:cinmash/app/app_routes.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/utils/colors.dart';
import '../../widgets/dropdown_custom.dart';
import '../../widgets/footer_text.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/text_field_custom.dart';
import '../controllers/personnal_data_controller.dart';
import '../widgets/register_error_box.dart';

class Personnalinformations extends StatelessWidget {
  Personnalinformations({super.key});

  final controller = Get.put(PersonnalDataController());


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
                  SizedBox(height: 35.h,),
                  Text("Inscription",
                      style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: "poppins")),
                  const SizedBox(height: 8),
                  Text("Entre vos informations de profil !",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.sp,
                          fontFamily: "poppins"
                      )),
                  const SizedBox(height: 20),
                  RegisterErrorBox(errors: controller.errors),
                  Row(
                    children: [
                      Expanded(
                          child: TextFieldCustom(
                            label: 'Nom',
                            asError: false,
                            func: (){},
                            controller: controller.name,
                            hint: "Nom",
                            isInvisible: false,
                            isPassword: false,
                          )),
                      const SizedBox(width: 10),
                      Expanded(child: TextFieldCustom(
                        label: 'Prénom',
                        asError: false,
                        func: (){},
                        controller: controller.lastName,
                        hint: "Prénom",
                        isInvisible: false,
                        isPassword: false,
                      )),
                    ],
                  ),
                  const SizedBox(height: 14),
                  TextFieldCustom(
                    label: 'Non de scene',
                    asError: false,
                    func: (){},
                    controller: controller.sceneName,
                    hint: "Atangana",
                    isInvisible: false,
                    isPassword: false,
                  ),
                  const SizedBox(height: 14),
                  TextFieldCustom(
                    label: 'Numero de telephone',
                    asError: false,
                    func: (){},
                    controller: controller.telephone,
                    hint: "+237 647 357 16",
                    isInvisible: false,
                    isPassword: false,
                  ),
                  const SizedBox(height: 14),
                  TextFieldCustom(
                    label: 'Ville',
                    asError: false,
                    func: (){},
                    controller: controller.ville,
                    hint: "Ville",
                    isInvisible: false,
                    isPassword: false,
                  ),
                  const SizedBox(height: 14),
                  DropdownCustom(
                    label: 'Pays',
                    asError: false,
                    flag: controller.flage.value,
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
                          controller.flage.value = country.flagEmoji;
                          print(country.flagEmoji);
                          controller.pays.text = country.name;
                        },
                      );
                    },
                    controller: controller.pays,
                    hint: "Cameroun",
                    isInvisible: false,
                    isReadOnly: true,
                  ),
                  const SizedBox(height: 14),
                  DropdownCustom(
                    label: 'Date de naissance',
                    asError: false,
                    flag: "",
                    func: (){
                      _pickDate(context);
                    },
                    controller: controller.date,
                    hint: "14/02/2025",
                    isInvisible: false,
                    isReadOnly: true,
                  ),
                  const SizedBox(height: 14),
                  DropdownCustom(
                    label: 'Genre',
                    asError: false,
                    flag: "",
                    func: (){
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return SizedBox(
                              height: 250.h,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 22.h),
                                    child: Text(
                                      "Sélectionnez votre Genre",
                                      style: TextStyle(
                                          fontFamily: "poppins",
                                          fontSize: 14.sp
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: CupertinoPicker(
                                        itemExtent: 20.h,
                                        onSelectedItemChanged: (value) => value,
                                        children: [
                                          Text("Masculin", style: TextStyle(fontSize: 14.sp, fontFamily: "poppins"),),
                                          Text("Feminin", style: TextStyle(fontSize: 14.sp, fontFamily: "poppins"),),
                                          Text("Autres", style: TextStyle(fontSize: 14.sp, fontFamily: "poppins"),),
                                        ]
                                    ),
                                  ),
                                  Container(
                                    height: 70.h,
                                    width: double.maxFinite,
                                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                                    child: PrimaryButton(isLoading: false, func: () {  }, simpleText: 'Select',loadingText: "Select",),
                                  ),
                                ],
                              ),
                            );
                          }
                      );
                    },
                    controller: controller.genre,
                    hint: "Masculin",
                    isInvisible: false,
                    isReadOnly: true,
                  ),
                  const SizedBox(height: 20),
                  PrimaryButton(isLoading: false,func: (){Get.toNamed(AppPAges.pages[4].name);}, simpleText: 'Continuer',loadingText: "Enregistrement...",),
                  const SizedBox(height: 30),
                  const FooterText(),
                ],
              ),
            ),
          ],
        ),
      ),),
    );
  }

  Future<void> _pickDate(BuildContext context) async {
    DateTime initialDate = DateTime(2000, 1, 1);
    // DateTime initialDate = _birthDate ?? DateTime(2000, 1, 1);
    DateTime? picked;

    await showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).cardColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        DateTime tempPicked = initialDate;
        return SizedBox(
          height: 800,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 22.h),
                child: Text(
                  "Sélectionnez votre date de naissance",
                  style: TextStyle(
                      fontFamily: "poppins",
                      fontSize: 14.sp
                  ),
                ),
              ),
              Expanded(
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: initialDate,
                  minimumDate: DateTime(1900),
                  maximumDate: DateTime.now(),
                  onDateTimeChanged: (date) => tempPicked = date,
                ),
              ),
              Container(
                height: 80.h,
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                child: PrimaryButton(isLoading: false, func: () {  }, simpleText: 'Select',loadingText: "Select",),
              ),
            ],
          ),
        );
      },
    );
  }

}
