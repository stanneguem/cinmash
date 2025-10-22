import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cinmash/features/auth/register/widgets/register_success_dialog.dart';


class RegisterController extends GetxController {
  final errors = <String>[].obs;

  // Champs du formulaire
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

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

    if (email.text.trim().isEmpty) {
      errors.add("L'adresse email est obligatoire");
    } else if (!GetUtils.isEmail(email.text.trim())) {
      errors.add("L'adresse email est invalide");
    }


    if (password.text.isEmpty) {
      errors.add("Le mot de passe est obligatoire");
    } else {
      if (password.text.length < 8) {
        errors.add("Le mot de passe doit contenir au moins 8 caractères");
      }

      // Optionnel : renforcer la sécurité du mot de passe
      final hasUppercase = password.text.contains(RegExp(r'[A-Z]'));
      final hasLowercase = password.text.contains(RegExp(r'[a-z]'));
      final hasNumber = password.text.contains(RegExp(r'[0-9]'));
      final hasSpecialChar = password.text.contains(RegExp(r'[!@#\$&*~]'));

      if (!(hasUppercase && hasLowercase && hasNumber && hasSpecialChar)) {
        errors.add("Le mot de passe doit contenir au moins une majuscule, une minuscule, un chiffre et un symbole spécial");
      }
    }

    if (confirmPassword.text.isEmpty) {
      errors.add("La confirmation du mot de passe est obligatoire");
    } else if (password.text != confirmPassword.text) {
      errors.add("Les mots de passe ne correspondent pas");
    }

    // --- Si aucune erreur ---
    if (errors.isEmpty) {
      // Exemple : afficher un dialogue de succès
      Get.dialog(RegisterSuccessDialog(name: email.text));
    }
  }
}
