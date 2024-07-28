import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ui_app/features/otp/otp.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLoginSelected = true;
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 18,
            ),
            Row(
              children: [
                IconButton(
                  iconSize: 24,
                  icon: Icon(Icons.chevron_left_rounded),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                          'Please login or sign up to continue using this application',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400))
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isLoginSelected = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: !isLoginSelected
                              ? Colors.white
                              : HexColor('#5700FF'),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                color: HexColor('#605690'),
                              ),
                              borderRadius: BorderRadius.circular(20))),
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: isLoginSelected
                                ? Colors.white
                                : HexColor('#605690'),
                            fontFamily: GoogleFonts.roboto().fontFamily,
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      )),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: !isLoginSelected
                              ? HexColor('#5700FF')
                              : Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                color: HexColor('#605690'),
                              ),
                              borderRadius: BorderRadius.circular(20))),
                      onPressed: () {
                        setState(() {
                          isLoginSelected = false;
                        });
                      },
                      child: Text('Sign Up',
                          style: TextStyle(
                              color: !isLoginSelected
                                  ? Colors.white
                                  : HexColor('#5700FF'),
                              fontFamily: GoogleFonts.roboto().fontFamily,
                              fontWeight: FontWeight.w500,
                              fontSize: 14))),
                ),
                const SizedBox(
                  width: 16,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Username',
                      suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Icon(Icons.clear_rounded))),
                      labelStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: GoogleFonts.roboto().fontFamily),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      // Set border for focused state
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(5),
                      ))),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: TextField(
                  obscureText: true,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Icon(Icons.clear_rounded))),
                      labelStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: GoogleFonts.roboto().fontFamily),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      // Set border for focused state
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(5),
                      ))),
            ),
            Visibility(
              visible: !isLoginSelected,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 30),
                child: TextField(
                    decoration: InputDecoration(
                        labelText: 'Mobile No.',
                        suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Icon(Icons.clear_rounded))),
                        labelStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: GoogleFonts.roboto().fontFamily),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.black),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        // Set border for focused state
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.black),
                          borderRadius: BorderRadius.circular(5),
                        ))),
              ),
            ),
            Visibility(
              visible: !isLoginSelected,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 30),
                child: TextField(
                    decoration: InputDecoration(
                        labelText: 'Email Id',
                        suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Icon(Icons.clear_rounded))),
                        labelStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: GoogleFonts.roboto().fontFamily),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.black),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        // Set border for focused state
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.black),
                          borderRadius: BorderRadius.circular(5),
                        ))),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, top: 30),
              child: Row(
                children: [
                  Checkbox(
                    value: isSelected,
                    onChanged: (value) {
                      setState(() {
                        isSelected = value!;
                      });
                    },
                  ),
                  Text(
                    'I Agree to all Terms & Conditions.',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        fontFamily: GoogleFonts.inter().fontFamily),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Otp();
                  },
                ));
              },
              child: Container(
                height: 40,
                margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: HexColor('#F6DE00'),
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  isLoginSelected ? 'Login' : 'Sign Up',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      fontFamily: GoogleFonts.roboto().fontFamily),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
