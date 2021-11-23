import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class GreenButton extends StatelessWidget {
  const GreenButton({
    Key? key,
    this.onPressed,
    this.label,
    this.width,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String? label;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      //minWidth: width!,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        color: const Color(0xFF27AE60),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        onPressed: onPressed,
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.w),
        child: Text(
          label!,
          style: GoogleFonts.roboto(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class GrayButton extends StatelessWidget {
  const GrayButton({
    Key? key,
    this.onPressed,
    this.label,
    this.width,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String? label;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      //minWidth: width!,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: const Color(0xFF333333),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        onPressed: onPressed,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.w),
        child: Text(
          label!,
          style: GoogleFonts.roboto(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
