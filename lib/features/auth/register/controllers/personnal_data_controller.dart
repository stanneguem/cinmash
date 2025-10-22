import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cinmash/features/auth/register/widgets/register_success_dialog.dart';


class PersonnalDataController extends GetxController {
  final errors = <String>[].obs;
  final flage = "🇨🇲".obs;

  // Champs du formulaire
  final name = TextEditingController();
  final lastName = TextEditingController();
  final sceneName = TextEditingController();
  final date = TextEditingController();
  final ville = TextEditingController();
  final pays = TextEditingController();
  final genre = TextEditingController();
  final telephone = TextEditingController();

  // États d'affichage
  final isPasswordInvisible = true.obs;
  final isConfirmPasswordInvisible = true.obs;

  // --- Méthodes de visibilité ---
  void changePasswordVisible() {
    isPasswordInvisible.value = !isPasswordInvisible.value;
  }

  void changeConfirmPasswordVisible() {
    isConfirmPasswordInvisible.value = !isConfirmPasswordInvisible.value;
  }

  // --- Validation des champs ---
  void register() {
    errors.value.clear(); // Réinitialiser les erreurs

    // Vérification des champs obligatoires
    if (name.text.trim().isEmpty) {
      errors.add("Le prénom est obligatoire");
    }

    if (lastName.text.trim().isEmpty) {
      errors.add("Le nom est obligatoire");
    }


    if (pays.text.trim().isEmpty) {
      errors.add("Le pays est obligatoire");
    }


    // --- Si aucune erreur ---
    if (errors.isEmpty) {
      // Exemple : afficher un dialogue de succès
      Get.dialog(RegisterSuccessDialog(name: name.text));
    }
  }
}
