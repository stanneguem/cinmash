import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterErrorBox extends StatelessWidget {
  final List<String> errors;

  const RegisterErrorBox({super.key, required this.errors});

  @override
  Widget build(BuildContext context) {
    if (errors.isEmpty) return const SizedBox.shrink();

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF2B1C1C),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Obx(() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.error_outline, color: Colors.redAccent, size: 20),
              SizedBox(width: 6),
              Text(
                "Des erreurs sont survenues",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ...errors.map(
                (e) => Text(
              "• $e",
              style: const TextStyle(color: Colors.redAccent, fontSize: 13),
            ),
          ),
        ],
      ),),
    );
  }
}
