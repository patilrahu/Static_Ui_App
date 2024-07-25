import 'package:flutter/material.dart';
import 'package:ui_app/constant/image_constant.dart';
import 'package:ui_app/features/splash/splashscreen.dart';

class Welcome extends StatefulWidget {
  final VoidCallback onWelcomeScreenExit;
  const Welcome({super.key, required this.onWelcomeScreenExit});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      widget.onWelcomeScreenExit();
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                        builder: (context) {
                          return const Splash();
                        },
                      ), (route) => false);
                    },
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10, top: 10),
                          child: Image.asset(
                            ImageConstant.logo,
                            width: 50,
                            height: 50,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Welcome to ,',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.deepPurple),
                              ),
                              Text(
                                'Navi Mumbai Police App',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.deepPurple),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(
                      children: [
                        const Text(
                          'Login/signup',
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Container(
                            decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(20)),
                            child: const Icon(
                              Icons.person_3_outlined,
                              size: 20,
                            ))
                      ],
                    ),
                  )
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    Icon(
                      Icons.settings,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Services',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
