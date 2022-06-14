import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonNavbar extends StatelessWidget {
  const ButtonNavbar({Key? key, this.icon, this.label, this.onTap}) : super(key: key);

  final IconData? icon;
  final String? label;
  final VoidCallback? onTap;


  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: InkWell(
        borderRadius: BorderRadius.circular(3),
        highlightColor: const Color(0xFF27AE60).withOpacity(0.40),
        overlayColor: MaterialStateProperty.all(const Color(0xFF27AE60).withOpacity(0.40)),
        onTap:
          onTap,
        child: Ink(
          child: Flex(
            mainAxisSize: MainAxisSize.max,
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white.withOpacity(0.74),
              ),
              Text(
                '$label',
                style: TextStyle(
                  fontFamily: 'BlissPro',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(0.74),
                ),
              ).tr(),
            ],
          ),
        ),
      ),
    );
  }
}
