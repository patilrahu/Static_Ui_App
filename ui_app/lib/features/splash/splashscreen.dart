import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:glossy/glossy.dart';
import 'package:ui_app/constant/image_constant.dart';
import 'package:ui_app/features/home/home.dart';
import 'package:ui_app/features/welcome/welcomescreen.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Image.asset(
            ImageConstant.background_splash,
          ),
          Container(
            color:
                Colors.black.withOpacity(0.5), // Adjust the opacity as needed
            width: double.infinity,
            height: double.infinity,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                builder: (context) {
                  return const Home();
                },
              ), (route) => false);
            },
            child: Center(
              child: Image.asset(
                ImageConstant.logo,
                width: 170,
                height: 170,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
