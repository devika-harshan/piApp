import 'package:flutter/material.dart';
import 'package:piapp/nextsscreen.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 2000), () {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const NextSScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const curve = Curves.easeOut;
            final curvedAnimation =
                CurvedAnimation(parent: animation, curve: curve);
            return FadeTransition(opacity: curvedAnimation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 500),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Stack(
        children: [
          Positioned(
            top: 323.h,
            left: 53.w,
            child: Image(
              image: AssetImage(
                'Images/logo 2.png',
              ),
              width: 117.w,
              height: 117.h,
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
            top: 348.h,
            left: 172.w,
            child: Text(
              "The",
              style: TextStyle(
                fontSize: 24.sp,
                fontFamily: 'Arial',
                fontWeight: FontWeight.w900,
                color: Color(0xFF1478BE),
              ),
            ),
          ),
          Positioned(
            top: 363.h,
            left: 172.w,
            child: Row(
              children: [
                Text(
                  "PI",
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 50.sp,
                    fontWeight: FontWeight.w900,
                    color: Color(0xff203b74),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(width: screenWidth * 0.02),
                Text(
                  "App",
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 50.sp,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF1478BE),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Positioned(
            top: 442.h,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Learning & Upskilling App for Jobs',
                style: TextStyle(
                  fontFamily: 'Dubai',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff004AAD),
                ),
              ),
            ),
          ),
          Positioned(
            top: 490.h,
            left: 0,
            right: 0,
            child: Center(
              child: Image(
                image: AssetImage(
                  'Images/image 13 (1).png',
                ),
                width: 335.w,
                height: 25.h,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Positioned(
            top: 568.h,
            left: 0.w,
            right: 0.w,
            child: Center(
              child: Image(
                image: AssetImage(
                  'Images/Clock (1).png',
                ),
                width: 72.w,
                height: 72.h,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            top: 640.h,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Loading......',
                style: TextStyle(
                  fontSize: 13.sp,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Positioned(
            top: 785.h,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Target 10+ Million Users Downloads',
                style: GoogleFonts.archivoNarrow(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Positioned(
            top: 830.h,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(
                    'Images/Instagram (2).png',
                  ),
                  width: 57.w,
                  height: 35.h,
                  fit: BoxFit.fill,
                ),
                Text(
                  '@The_pi_app',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20.sp,
                    color: Color(0xff203B74),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
