import 'package:cinmash/app/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterSuccessDialog extends StatelessWidget {
  final String name;
  const RegisterSuccessDialog({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFF232323),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/images/Group 12 1.png"),
            const SizedBox(height: 16),
            Text("Hello $name",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18.sp, fontFamily: "poppins")),
            const SizedBox(height: 8),
            Text("Votre compte a été créé avec succès.",textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 12.sp, fontFamily: "poppins")),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () {
                Get.offNamed(AppPAges.pages[3].name);
              },
              child: const Text("Ok", style: TextStyle(fontFamily: "poppins"),),
            ),
          ],
        ),
      ),
    );
  }
}
