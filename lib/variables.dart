import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final TextStyle labelStyle = GoogleFonts.mPlus1(
  fontSize: 20.sp,
  fontWeight: FontWeight.w200,
);

final TextStyle hintStyle = GoogleFonts.mPlus1(
  letterSpacing: 2,
  fontSize: 24.sp,
  fontWeight: FontWeight.w400,
);

final TextStyle inputTextStyle = GoogleFonts.mPlus1(
  fontSize: 16.sp,
  fontWeight: FontWeight.w400,
);

final OutlineInputBorder inputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.black, width: 1.w),
  borderRadius: BorderRadius.circular(10.r),
);

// Reusable TextField widget
Widget customTextField({
  required String labelText,
  required String hintText,
  required TextInputType inputType,
  required Function(String) onChanged,
  Widget? suffixIcon,
}) {
  return TextField(
    onChanged: onChanged,
    keyboardType: inputType,
    decoration: InputDecoration(
      border: inputBorder,
      labelText: labelText,
      labelStyle: labelStyle,
      hintText: hintText,
      hintStyle: hintStyle,
      contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
      suffixIcon: suffixIcon,
    ),
    style: inputTextStyle,
  );
}

// Reusable ElevatedButton widget
Widget customButton({
  required String text,
  required VoidCallback onPressed,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xff004AAD),
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    child: Text(
      text,
      style: GoogleFonts.inter(
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}
