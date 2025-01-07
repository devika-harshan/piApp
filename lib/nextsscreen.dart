import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_controller.dart'
    as carousel_controller;

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:piapp/adscreen.dart';

class NextSScreen extends StatefulWidget {
  const NextSScreen({super.key});

  @override
  State<NextSScreen> createState() => _NextSScreenState();
}

class _NextSScreenState extends State<NextSScreen> {
  final carousel_controller.CarouselController _carouselController =
      carousel_controller.CarouselController();

  int _currentIndex = 0;

  final List<Map<String, String>> carouselItems = [
    {
      "image": "Images/Dreaming about future occupation (1).png",
      "title": "BRINGS YOUR DREAMS TO LIFE",
      "subtitle":
          "Stay focused on your goal, jot down all your dreams and try to do your best execution.",
    },
    {
      "image": "Images/Women brainstorming ideas and working in team (1).png",
      "title": "TIME TO COLLABORATE",
      "subtitle":
          "You can invite all your friends and start upskilling together to make all your dreams come true.",
    },
    {
      "image": "Images/Work team brainstorming in conference room (1).png",
      "title": "LIVE YOUR DREAM",
      "subtitle":
          "Now your dream will soon come true, do the best according to what has been planned.",
    },
  ];

  void _onNextPressed() {
    if (_currentIndex < carouselItems.length - 1) {
      _carouselController.nextPage();
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Adscreen()),
      );
    }
  }

  void _onSkipPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Adscreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xffF7F7F7),
      body: Stack(
        children: [
          // Logo background
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
              left: 0,
              top: 348.h,
              child: Image.asset(
                'Images/Vector 2.png',
                fit: BoxFit.fill,
                height: 251.h,
                width: 41.w,
              )),
          Positioned(
              right: 0,
              top: 158.h,
              child: Image.asset(
                'Images/Vector 1.png',
                fit: BoxFit.fill,
                height: 365.h,
                width: 57.w,
              )),
          // Carousel Slider
          Positioned(
            left: 0,
            right: 0,
            top: 211.h,
            child: Column(
              children: [
                CarouselSlider(
                  carouselController: _carouselController,
                  options: CarouselOptions(
                    height: 565.h,
                    enlargeCenterPage: true,
                    viewportFraction: 1.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  items: carouselItems.map((item) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Image
                        Image.asset(
                          item["image"]!,
                          fit: BoxFit.contain,
                          height: 319.h,
                          width: 319.w,
                        ),
                        SizedBox(height: 16.h),

                        // Title
                        Text(
                          item["title"]!,
                          style: GoogleFonts.adventPro(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff000000),
                          ),
                          textAlign: TextAlign.center,
                        ),

                        // Subtitle
                        Padding(
                          padding: EdgeInsets.only(
                            left: 32.w,
                            right: 32.w,
                            top: 8.h,
                          ),
                          child: Text(
                            item["subtitle"]!,
                            style: GoogleFonts.dosis(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff000000),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          Positioned(
            top: 735.h,
            right: 0,
            left: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return GestureDetector(
                  onTap: () => _carouselController.animateToPage(index),
                  child: Container(
                    width: 49.w,
                    height: 4.w,
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: _currentIndex == index
                          ? const Color(0xff1478BE)
                          : const Color(0xffE5ECF6),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          // "Skip" Button
          Positioned(
            top: 791.h,
            left: 0,
            child: ElevatedButton(
              onPressed: _onSkipPressed,
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
              onPressed: _onNextPressed,
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
                "NEXT",
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
