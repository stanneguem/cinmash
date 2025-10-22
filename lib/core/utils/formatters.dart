
bool isValidEmail(String input) {
  final regex = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@"
      r"[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?"
      r"(?:\.[a-zA-Z]{2,})+$"
  );
  return regex.hasMatch(input.trim());
}

String? emailValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Veuillez entrer une adresse email';
  }
  if (!isValidEmail(value)) {
    return 'Adresse email invalide';
  }
  return null; // tout est OK
}
