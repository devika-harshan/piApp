import 'package:flutter/material.dart';
import 'package:piapp/apihandler.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:piapp/mobilelogin.dart';

import 'package:piapp/welcomepage.dart';
import 'model.dart';

class MobileReg extends StatefulWidget {
  @override
  _MobileRegState createState() => _MobileRegState();
}

class _MobileRegState extends State<MobileReg> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final ApiHandler _apiHandler = ApiHandler();
  bool _isLoading = false;

  void _registerUserPhone() async {
    // Get input values and trim whitespace
    String userName = _nameController.text.trim();
    String userPhone = _phoneController.text.trim();
    String userPassword = _passwordController.text.trim();

    if (userName.isEmpty) {
      _showMessage('Please enter your name');
      return;
    }
    if (userPhone.isEmpty) {
      _showMessage('Please enter your phone number');
      return;
    }
    if (userPassword.isEmpty) {
      _showMessage('Please enter your password');
      return;
    }

    // Create a new user object
    final newUserPhone = UserPhone(
      id: 0, // Assuming ID is auto-generated by the backend
      name: userName,
      phone: userPhone,
      password: userPassword,
    );

    // Set loading state
    _setLoading(true);

    try {
      // Send the user registration request
      final response = await _apiHandler.addUserPhone(userPhone: newUserPhone);

      if (response.statusCode == 201) {
        // Successfully registered
        _showMessage('User registered successfully!');
        // Navigate to WelcomePage
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => WelcomePage()),
        );
      } else if (response.statusCode == 409) {
        // Phone number already registered
        _showMessage('A user with this phone number is already exists');
      } else if (response.statusCode == 404) {
        // User not found or other issues
        _showMessage('User not registered');
      } else {
        // Handle other error responses
        String errorMessage =
            response.body.isNotEmpty ? response.body : 'Unknown error occurred';
        _showMessage('Failed to register user: $errorMessage');
      }
    } catch (e) {
      // Catch and display errors
      _showMessage('An error occurred: ${e.toString()}');
    } finally {
      // Reset loading state
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    setState(() {
      _isLoading = value;
    });
  }

  void _showMessage(String message) {
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
                  top: 276.h,
                  left: 0.w,
                  right: 0.w,
                  child: Text(
                    "Sign Up",
                    style: GoogleFonts.inter(
                      fontSize: 36.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF000000),
                    ),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
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
                        controller: _nameController,
                        keyboardType: TextInputType.name,
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
                          labelText: "Name",
                          labelStyle: GoogleFonts.mPlus1(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w200,
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
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
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
                          labelText: "Phone Number",
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
                          prefixText: "+91 ", // Prefix text "91"
                          prefixStyle: GoogleFonts.mPlus1(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                          ),
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
                  top: 583.h,
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
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.h),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          labelText: "Password",
                          labelStyle: GoogleFonts.mPlus1(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w200,
                          ),
                          suffixIcon: IconTheme(
                            data: const IconThemeData(
                              color: Color(0xffFF6F71),
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
                  top: 738.h,
                  left: 0.w,
                  right: 0.w,
                  child: Center(
                    child: SizedBox(
                      height: 73.h,
                      width: 307.w,
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _registerUserPhone,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff004AAD),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: _isLoading
                            ? CircularProgressIndicator(
                                color: Colors.white) // Show progress indicator
                            : Center(
                                child: Text(
                                'Sign Up',
                                style: GoogleFonts.inter(
                                  fontSize: 23.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                                overflow: TextOverflow
                                    .ellipsis, // This is the overflow property
                              )),
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: 831.h,
                  left: 97.w,
                  right: 97.w,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Already Registered?",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w700,
                            fontSize: 16.sp,
                            color: Colors.black,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigate to the WelcomePage
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MobileLogin()),
                            );
                          },
                          child: Text(
                            "Login here",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w700,
                              fontSize: 16.sp,
                              color: Color(0xff0A179C),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
