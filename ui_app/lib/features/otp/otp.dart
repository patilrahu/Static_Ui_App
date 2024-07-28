import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
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
                        'Mobile OTP Verification',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 30),
              child: TextField(
                  maxLength: 6,
                  decoration: InputDecoration(
                      labelText: 'Enter OTP sent on your mobile no.',
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
                  'Verify OTP',
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
