import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../app/app_routes.dart';
import '../../widgets/dropdown_custom.dart';
import '../../widgets/footer_text.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/text_area.dart';
import '../../widgets/text_field_custom.dart';
import '../controllers/personnal_data_controller.dart';

class ProfeessionalInformations extends StatelessWidget {
  ProfeessionalInformations({super.key});
  final controller = Get.put(PersonnalDataController());
  final TextEditingController _bioController = TextEditingController();

  final List<String> competences = [
    'Acteur', 'Réalisateur', 'Monteur', 'Scénariste', 'Producteur',
    'Cadreur', 'Ingénieur son', 'Maquilleur', 'Accessoiriste', 'Photographe', 'Entreprise'
  ];

  final List<String> typesProjet = [
    'Court-métrage', 'Long-métrage', 'Série TV', 'Documentaire',
    'Publicité', 'Clip musical', 'Film institutionnel', 'Autre'
  ];

  final List<String> roles = [
    'Principal', 'Secondaire', 'Cameraman', 'Réalisateur', 'Producteur',
    'Monteur', 'Scénariste', 'Ingénieur son', 'Maquilleur', 'Accessoiriste',
    'Photographe plateau', 'Assistant réalisation', 'Régisseur'
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  SizedBox(height: 115.h,),
                  Text("Inscription",
                      style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: "poppins")),
                  SizedBox(height: 8.h),
                  Text("Entre vos informations Pro !",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.sp,
                          fontFamily: "poppins"
                      )),
                  SizedBox(height: 14.h),
                  TextFieldCustom(
                    label: 'Non de scene',
                    asError: false,
                    func: (){},
                    controller: controller.sceneName,
                    hint: "Atangana",
                    isInvisible: false,
                    isPassword: false,
                  ),
                  SizedBox(height: 14.h),
                  DropdownCustom(
                    label: 'Competence pricipale',
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
                                        children: List.generate(
                                          competences.length,
                                          (index) {
                                            return Text(competences[index], style: TextStyle(fontSize: 14.sp, fontFamily: "poppins"),);
                                          },
                                        )
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
                    hint: "Entre votre Competence pricipale",
                    isInvisible: false,
                    isReadOnly: true,
                  ),
                  SizedBox(height: 14.h),
                  DropdownCustom(
                    label: 'Competence Secondaire',
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
                                        children: List.generate(
                                          competences.length,
                                              (index) {
                                            return Text(competences[index], style: TextStyle(fontSize: 14.sp, fontFamily: "poppins"),);
                                          },
                                        )
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
                    hint: "Entre une Competence Secondaire",
                    isInvisible: false,
                    isReadOnly: true,
                  ),
                  SizedBox(height: 14.h),
                  DropdownCustom(
                    label: 'Date de Debut',
                    asError: false,
                    flag: "",
                    func: (){
                      _pickDate(context);
                    },
                    controller: controller.date,
                    hint: "Quand avez vous commencer le cinema",
                    isInvisible: false,
                    isReadOnly: true,
                  ),
                  SizedBox(height: 14.h),
                  TextArea(
                    hint: "Parler nous de vous qui etes vous que rechercherz vous ?",
                    asError: false,
                    label: "Description",
                    controller: _bioController,
                    func: (){},
                  ),
                  SizedBox(height: 20.h),
                  PrimaryButton(isLoading: false,func: (){Get.toNamed(AppPAges.pages[5].name);}, simpleText: 'Continuer',loadingText: "Enregistrement...",),
                  const SizedBox(height: 30),
                  const FooterText(),
                ],
              ),
            )
          ],
        ),
      ),
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