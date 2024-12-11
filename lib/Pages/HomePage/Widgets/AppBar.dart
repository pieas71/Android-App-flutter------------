import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobile_app/Config/Colors.dart';
import 'package:mobile_app/main.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset("Assets/Icons/dashoard.svg"),
          Text("বইয়ের-হাট",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(color: Color.fromARGB(255, 247, 241, 245))),
          CircleAvatar(
            child: IconButton(
              icon: Icon(Icons.logout,
                  color: const Color.fromARGB(255, 111, 89, 136)),
              onPressed: () async {
                await FirebaseAuth.instance.signOut(); // Firebase logout
                Get.offAll(() => const Login()); // Navigate to Login page
              },
            ),
          ),
        ]);
  }
}
