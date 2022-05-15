import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../pages/promotion_page.dart';
import '../pages/qr_page.dart';
import '../pages/settings_page.dart';

class NavBarMain extends StatelessWidget {
  const NavBarMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Color(0xFF333333),
      ),
      child: SizedBox(
        height: 56.w,
        width: 1.sw,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 35.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Get.offAll(() => const QRPage());
                },
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.crop_free,
                        color: Colors.white.withOpacity(0.74),
                      ),
                      Text(
                        'QR',
                        style: TextStyle(
                          fontFamily: 'BlissPro',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withOpacity(0.74),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.off(() => const PromotionPage());
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 25.w),
                  child: SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.info_outlined,
                          color: Colors.white.withOpacity(0.74),
                        ),
                        Text(
                          'discount',
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
              ),
              GestureDetector(
                onTap: () {
                  Get.off(() => const SettingsPage());
                },
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.settings_outlined,
                        color: Colors.white.withOpacity(0.74),
                      ),
                      Text(
                        'settings',
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
