import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:piapp/emailreg.dart';
import 'package:piapp/mobilereg.dart';

import 'package:piapp/welcomepage.dart';

class ChoosePage extends StatefulWidget {
  @override
  _ChoosePageState createState() => _ChoosePageState();
}

class _ChoosePageState extends State<ChoosePage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Stack(
        children: [
          Positioned(
            top: 97.h,
            left: 115.w,
            child: Container(
              width: 184.w,
              height: 54.h,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xffdfdfdf), width: 1.w),
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(30.r),
                  right: Radius.circular(30.r),
                ),
              ),
            ),
          ),
          // Logo image
          Positioned(
            top: 97.h,
            left: 111.w,
            child: Image(
              image: const AssetImage('Images/logo 2.png'),
              width: 54.w,
              height: 55.h,
              fit: BoxFit.fill,
            ),
          ),

          Positioned(
            top: screenHeight * 0.105,
            left: 176.w,
            child: Text(
              "The",
              style: TextStyle(
                fontSize: 15.sp,
                fontFamily: 'Arial',
                fontWeight: FontWeight.w900,
                color: const Color(0xFF1478BE),
              ),
            ),
          ),
          Positioned(
            top: 116.h,
            left: 176.w,
            child: Row(
              children: [
                Text(
                  "PI",
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w900,
                    color: const Color(0xff203b74),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(width: screenWidth * 0.02),
                Text(
                  "App",
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w900,
                    color: const Color(0xFF1478BE),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Positioned(
            top: 161.h,
            left: 0.w,
            right: 0.w,
            child: Center(
              child: Text(
                "Learning & Upskilling App for Jobs",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF000000),
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Positioned(
            top: 520.h,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                "Sign Up",
                style: GoogleFonts.inter(
                  fontSize: 36.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF0A179C),
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Positioned(
            top: 579.h,
            left: 0,
            right: 0,
            child: Text(
              "Continue with Mail & Number",
              style: GoogleFonts.inter(
                fontSize: 20.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xff000000),
              ),
              textAlign: TextAlign.center,
            ),
          ),

          Positioned(
            top: 656.h,
            left: 17.w,
            right: 17.w,
            child: SizedBox(
              height: 70.h,
              width: 364.w,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MobileReg()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff004AAD),
                  foregroundColor: Colors.white,
                  padding:
                      EdgeInsets.symmetric(vertical: 16.h, horizontal: 40.w),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.call,
                      size: 20,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      'Sign Up with Number',
                      style: GoogleFonts.inter(
                          fontSize: 24.sp, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            top: 736.h,
            left: 17.w,
            right: 17.w,
            child: SizedBox(
              height: 70.h,
              width: 364.w,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EmailReg()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff004AAD),
                  foregroundColor: Colors.white,
                  padding:
                      EdgeInsets.symmetric(vertical: 16.h, horizontal: 70.w),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.email_outlined, // Replace with your desired icon
                      size: 20,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      'Sign Up with Email',
                      style: GoogleFonts.inter(
                          fontSize: 24.sp, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Positioned(
              top: 833.h,
              left: 0.w,
              right: 0.w,
              child: Center(
                child: SizedBox(
                  width: 246.w,
                  child: ElevatedButton(
                      onPressed: () {
                        // Navigate to the WelcomePage
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WelcomePage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffFFFFFF),
                          side: BorderSide(color: Colors.black, width: 1.w),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 20.h)),
                      child: Text('Sign As Guest',
                          style: GoogleFonts.inter(
                            color: Colors.black, // Text color
                            fontSize: 20.sp, fontWeight: FontWeight.w200,
                          ),
                          textAlign: TextAlign.center)),
                ),
              ))
        ],
      ),
    );
  }
}
