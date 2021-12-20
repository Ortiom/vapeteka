import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class GreenButton extends StatelessWidget {
  const GreenButton({
    Key? key,
    this.onPressed,
    this.label,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
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
    );
  }
}

class GrayButton extends StatelessWidget {
  const GrayButton({
    Key? key,
    this.onPressed,
    this.label,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
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

class CatalogItemButton extends StatelessWidget {
  const CatalogItemButton({Key? key, this.onPressed, this.title})
      : super(key: key);

  final String? title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12.w),
            Text(
              title!,
              style: GoogleFonts.roboto(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 4.w),
            Padding(
              padding: EdgeInsets.only(left: 4.w),
              child: Divider(
                thickness: 1.w,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemButton extends StatelessWidget {
  const ItemButton({
    Key? key,
    this.image,
    this.title,
    this.onPressed,
  }) : super(key: key);

  final String? image;
  final String? title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        children: [
          Image.asset(
            image!,
            width: 171.w,
          ),
          Positioned(
            bottom: 0,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: Color.fromARGB(38, 0, 0, 0),
              ),
              child: SizedBox(
                width: 147.w,
                height: 24.w,
                child: Text(
                  title!,
                  style: GoogleFonts.roboto(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PromotionItem extends StatelessWidget {
  const PromotionItem({
    Key? key,
    this.title,
    this.date,
    this.body,
  }) : super(key: key);

  final String? title;
  final String? date;
  final String? body;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 12.w),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 160.w,
              child: Text(
                title!,
                style: GoogleFonts.roboto(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              width: 80.w,
              child: Text(
                date!,
                style: GoogleFonts.roboto(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 4.w),
        SizedBox(
          width: 250.w,
          child: Text(
            body!,
            style: GoogleFonts.roboto(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xFFBDBDBD),
            ),
          ),
        ),
        SizedBox(height: 4.w),
        Padding(
          padding: EdgeInsets.only(left: 4.w),
          child: Divider(
            thickness: 1.w,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
