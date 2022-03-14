import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vapeteka/controllers/api_controller.dart';
import 'package:vapeteka/presentation/pages/catalog_page.dart';
import 'package:vapeteka/presentation/pages/promotion_page.dart';
import 'package:vapeteka/presentation/pages/settings_page.dart';

import '../pages/qr_page.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({Key? key}) : super(key: key);

  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  ApiController apiController = Get.find();

  @override
  Widget build(BuildContext context) {
    return apiController.discountInt! >= 10
        ? DecoratedBox(
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
                        Get.off(() => const CatalogPage());
                      },
                      child: SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.store_outlined,
                              color: Colors.white.withOpacity(0.74),
                            ),
                            Text(
                              'catalog',
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
                    GestureDetector(
                      onTap: () {
                        Get.off(() => const PromotionPage());
                      },
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
          )
        : DecoratedBox(
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

class CustomScaffold extends StatefulWidget {
  const CustomScaffold({
    Key? key,
    this.title,
    this.children,
    this.actions,
    this.showLeading,
    this.navBar,
  }) : super(key: key);

  final String? title;
  final List<Widget>? children;
  final List<Widget>? actions;
  final bool? showLeading;
  final Widget? navBar;

  @override
  _CustomScaffoldState createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: widget.navBar ?? const CustomNavBar(),
      appBar: AppBar(
        actions: widget.actions,
        title: Text(
          widget.title ?? '',
          style: TextStyle(
              fontFamily: 'BlissPro',
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white),
        ).tr(),
        backgroundColor: const Color(0xFF333333),
        automaticallyImplyLeading: widget.showLeading ?? true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: widget.children ?? [],
          ),
        ),
      ),
    );
  }
}
