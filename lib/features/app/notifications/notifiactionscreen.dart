import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Notifiactionscreen extends StatelessWidget {
  const Notifiactionscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications", style: TextStyle(
          fontSize: 16.sp,
          fontFamily: "poppins"
        ),),
      ),
      body: ListView.builder(
        itemCount: 5,
          itemBuilder: (context, index) {
            return ListTile(
                title: Text(" $index nombre"),
              trailing: Icon(Icons.notifications),
            );
          },
      ),
    );
  }
}
