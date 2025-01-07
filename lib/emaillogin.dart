import 'package:flutter/material.dart';
import 'package:piapp/apihandler.dart';
import 'package:piapp/mobilelogin.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:piapp/choosepage.dart';

import 'package:piapp/welcomepage.dart';

class EmailLogin extends StatefulWidget {
  @override
  _EmailLoginState createState() => _EmailLoginState();
}

class _EmailLoginState extends State<EmailLogin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final ApiHandler _apiHandler = ApiHandler();
  bool _isLoading = false;

  void _loginUser() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty) {
      _showSnackBar('Please enter your email');
      return;
    }

    if (password.isEmpty) {
      _showSnackBar('Please enter your password');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final response =
          await _apiHandler.login(email: email, password: password);

      if (response.statusCode == 200) {
        _showSnackBar('Login successful!');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => WelcomePage()),
        );
      } else if (response.statusCode == 401) {
        _showSnackBar('Invalid email or password');
      } else {
        _showSnackBar('An error occurred. Please try again.');
      }
    } catch (e) {
      _showSnackBar('Error: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Positioned(
                  top: 97.h,
                  left: 115.w,
                  child: Container(
                    width: 184.w,
                    height: 54.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: const Color(0xffdfdfdf), width: 1.w),
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
                  left: 0,
                  right: 0,
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
                  top: 276.h,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Text(
                      "Login",
                      style: GoogleFonts.inter(
                        fontSize: 36.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF000000),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Positioned(
                  top: 371.h,
                  left: 0.w,
                  right: 0.w,
                  child: Center(
                    child: SizedBox(
                      width: 332.w,
                      height: 66.h,
                      child: TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black,
                                width: 1), // Same as enabled border
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          labelText: "Email",
                          labelStyle: GoogleFonts.mPlus1(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w200,
                          ),
                          hintStyle: GoogleFonts.mPlus1(
                            letterSpacing: 5,
                            fontSize: 24.sp, // Adjust hint text size
                            fontWeight: FontWeight.w400,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12.h, horizontal: 12.w),
                        ),
                        style: GoogleFonts.mPlus1(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: 477.h,
                  left: 0.w,
                  right: 0.w,
                  child: Center(
                    child: SizedBox(
                      width: 332.w,
                      height: 66.h,
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        obscuringCharacter: '*',
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.h),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black,
                                width: 1.h), // Same as enabled border
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          labelText: "Password",
                          labelStyle: GoogleFonts.mPlus1(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w200,
                          ),
                          suffixIcon: IconTheme(
                            data: const IconThemeData(
                              color: Color(0xffFF6F71), // Set the color to red
                            ),
                            child: const Icon(Icons.lock),
                          ),
                          hintStyle: GoogleFonts.mPlus1(
                            letterSpacing: 5,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12.h, horizontal: 12.w),
                        ),
                        style: GoogleFonts.mPlus1(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: 574.h,
                  left: 56.w,
                  right: 56.w,
                  child: SizedBox(
                    height: 73.h,
                    width: 307.w,
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _loginUser,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff004AAD),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Center(
                        child: _isLoading
                            ? CircularProgressIndicator(
                                color: Colors.white) // Show progress indicator
                            : Text(
                                'LOGIN',
                                style: GoogleFonts.inter(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w700),
                              ),
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: 663.h,
                  left: 98.w,
                  right: 98.w,
                  child: SizedBox(
                    height: 44.h,
                    width: 235.w,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MobileLogin()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff004AAD),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text(
                        'Login with Mobile Number',
                        style: GoogleFonts.lato(
                            fontSize: 14.sp, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: 749.h,
                  left: 97.w,
                  right: 97.w,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize
                          .min, // Ensure the Column wraps its content
                      children: [
                        Text(
                          "Not have an account?",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w200,
                            fontSize: 16.sp,
                            color: Colors.black,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChoosePage()),
                            );
                          },
                          child: Text(
                            "Signup here",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w200,
                              fontSize: 16.sp,
                              color: Color(0xff0A179C),
                            ),
                          ),
                        ),
                      ],
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
                                side:
                                    BorderSide(color: Colors.black, width: 1.w),
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
          ),
        ),
      ),
    );
  }
}
