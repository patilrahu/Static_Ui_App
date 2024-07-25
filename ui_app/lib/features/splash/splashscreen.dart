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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                builder: (context) {
                  return const Home();
                },
              ), (route) => false);
            },
            child: GlossyContainer(
              width: 200.0,
              height: 200.0,
              color: Colors.white,
              margin: const EdgeInsets.only(bottom: 10),
              borderRadius: BorderRadius.circular(15.0),
              child: Center(
                child: Image.asset(
                  ImageConstant.logo,
                  width: 170,
                  height: 170,
                ),
              ),
            ),
          ),
          const Center(
              child: Text(
            'Mobile App For Navi Mumbai Police',
            style: TextStyle(fontSize: 14, color: Colors.white),
          ))
        ],
      ),
    );
  }
}
