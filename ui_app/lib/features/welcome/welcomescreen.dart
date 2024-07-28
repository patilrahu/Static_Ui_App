import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ui_app/constant/image_constant.dart';
import 'package:ui_app/features/login/login.dart';
import 'package:ui_app/features/splash/splashscreen.dart';

final List<Map<String, String>> items = [
  {'imageUrl': ImageConstant.tenant, 'text': 'Tenant Intimation'},
  {'imageUrl': ImageConstant.approve, 'text': 'Occasion Permission'},
  {'imageUrl': ImageConstant.mobile, 'text': 'Mobile Lost'},
  {'imageUrl': ImageConstant.report, 'text': 'Reporting'},
  {'imageUrl': ImageConstant.lost, 'text': 'Lost & Found'},
  {'imageUrl': ImageConstant.cyber, 'text': 'Cyber Awareness'},
  {'imageUrl': ImageConstant.link, 'text': 'Quick Links'},
  {'imageUrl': ImageConstant.map, 'text': 'PHC Contact Info'},
  {'imageUrl': ImageConstant.diploma, 'text': 'PCC Domestic (General)'},
  {'imageUrl': ImageConstant.passport, 'text': 'PCC Overseas Employment'},
];

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
                            ImageConstant.welcomeicon,
                            width: 40,
                            height: 40,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Welcome to ,',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: HexColor('#1B004F')),
                              ),
                              Text(
                                'Navi Mumbai Police App',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w900,
                                    color: HexColor('#1B004F')),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return Login();
                          },
                        ));
                      },
                      child: Row(
                        children: [
                          const Text(
                            'Login/signup',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Image.asset(ImageConstant.profile)
                        ],
                      ),
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
                    color: HexColor('#F6DE00'),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    Image.asset(ImageConstant.serviceIcon),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Services',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  height: MediaQuery.of(context).size.height,
                  child: Options())
            ],
          ),
        ),
      ),
    );
  }
}

class Options extends StatefulWidget {
  Options({super.key});

  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 10 / 4.5,
        crossAxisCount: 2,
        mainAxisSpacing: 20,
      ),
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          color: Colors.white,
          elevation: 5,
          child: Row(
            children: [
              Image.asset(items[index]['imageUrl'].toString()),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  items[index]['text'].toString(),
                  style: TextStyle(
                      fontFamily: GoogleFonts.inter().fontFamily,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        );
      },
    );
  }
}
