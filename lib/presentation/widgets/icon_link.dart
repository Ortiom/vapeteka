import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LinkIconWidget extends StatelessWidget {

  final String? svgIcon;
  final VoidCallback? onTap;

  const LinkIconWidget({Key? key, this.svgIcon, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap:
        onTap,
      child: Ink(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
              height: 40.w,
              width: 40.w,
              child: SvgPicture.asset('$svgIcon', color: Colors.white,)),
        ),
      ),
    );
  }
}
