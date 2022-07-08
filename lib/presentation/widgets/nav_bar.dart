import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vapeteka/controllers/api_controller.dart';
import 'package:vapeteka/presentation/pages/catalog_page.dart';
import 'package:vapeteka/presentation/pages/promotion_page.dart';
import 'package:vapeteka/presentation/pages/settings_page.dart';
import 'package:vapeteka/presentation/widgets/button_navbar.dart';

import '../pages/qr_page.dart';

class CustomNavBar extends StatefulWidget {
  final bool? showCatalog;
  const CustomNavBar({Key? key, this.showCatalog}) : super(key: key);

  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: DecoratedBox(
              decoration: const BoxDecoration(
                color: Colors.transparent,
                // color: Color(0xFF333333),
              ),
              child: SizedBox(
                height: 56.w,
                width: 1.sw,
                child: const SizedBox(),
              )),
        ),
        Positioned.fill(
          child: Ink(
            color: const Color(0xFF333333),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ButtonNavbar(
                  label: 'qr',
                  icon: Icons.crop_free,
                  onTap: () {
                    Get.off(() => const QRPage());
                  },
                ),
                widget.showCatalog == false
                    ? const SizedBox()
                    : ButtonNavbar(
                  label: 'catalog',
                  icon: Icons.store_outlined,
                  onTap: () {
                    Get.off(() => const CatalogPage());
                  },
                ),
                ButtonNavbar(
                  label: 'discount',
                  icon: Icons.info_outlined,
                  onTap: () {
                    Get.off(() => const PromotionPage());
                  },
                ),
                ButtonNavbar(
                  label: 'settings',
                  icon: Icons.settings_outlined,
                  onTap: () {
                    Get.off(() => const SettingsPage());
                  },
                ),
              ],
            ),
          ),
        ),

      ],
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
    this.body,
  }) : super(key: key);

  final String? title;
  final List<Widget>? children;
  final List<Widget>? actions;
  final bool? showLeading;
  final Widget? body;

  @override
  _CustomScaffoldState createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  ApiController apiController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar:
          CustomNavBar(showCatalog: apiController.discountInt >= 10 ? true : false),
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
      body: widget.body ??
          SingleChildScrollView(
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
