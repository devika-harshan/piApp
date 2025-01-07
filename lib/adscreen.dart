import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:piapp/mobilelogin.dart';

import 'package:piapp/splash_screen.dart';

class Adscreen extends StatelessWidget {
  const Adscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7F7F7),
      body: Stack(
        children: [
          Positioned(
            top: 137.h,
            child: Image(
              image: const AssetImage('Images/image 6.png'),
              width: 414.w,
              height: 418.h,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            child: buildContainerWithCurvedBorders(),
          ),
          Positioned(
            top: 791.h,
            left: 0,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SplashScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE5ECF6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.r),
                    bottomRight: Radius.circular(30.r),
                  ),
                ),
                fixedSize: Size(142.w, 67.h),
              ),
              child: Text(
                "SKIP",
                style: GoogleFonts.hind(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xffB1B1B1),
                ),
              ),
            ),
          ),
          Positioned(
            top: 791.h,
            left: 271.w,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MobileLogin()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF004AAD),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.r),
                    bottomLeft: Radius.circular(30.r),
                  ),
                ),
                fixedSize: Size(142.w, 67.h),
              ),
              child: Text(
                "START",
                style: GoogleFonts.hind(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildContainerWithCurvedBorders() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 42.w),
    child: Stack(
      children: [
        Positioned(
          left: 0,
          right: 0.w,
          top: 609.h,
          child: Container(
            width: 322.w,
            height: 144.h,
            decoration: BoxDecoration(
              color: Color(0xffF7F7F7),
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
                color: Colors.black, // Border color
                width: 1.w, // Border width
              ),
            ),
          ),
        ),
        Positioned(
          top: 597.h,
          left: 0.w,
          right: 0.w,
          child: Center(
            child: Container(
              width: 277.w,
              height: 165.h,
              color: Color(0xffF7F7F7),
            ),
          ),
        ),
        Positioned(
          child: Center(
            child: Text(
              "Unlocking Potential,\nCreating Careers",
              style: TextStyle(
                fontFamily:
                    'DroidSans', // Ensure DroidSans is added to pubspec.yaml
                fontSize: 30.sp, // Adjust as needed
                fontWeight: FontWeight.w400, // Adjust as needed
                color: Colors.black, // Adjust color as needed
              ),
              textAlign: TextAlign.center, // Aligns the text
            ),
          ),
          top: 631.h, // Adjust as needed for positioning
          left: 0.w,
          right: 0.w,
        ),
      ],
    ),
  );
}
