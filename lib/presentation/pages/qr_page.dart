import 'package:barcode_widget/barcode_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:vapeteka/controllers/api_controller.dart';
import 'package:vapeteka/presentation/pages/promotion_page.dart';
import 'package:vapeteka/presentation/pages/settings_page.dart';
import 'package:vapeteka/presentation/widgets/nav_bar.dart';

import 'catalog_page.dart';

class QRPage extends StatefulWidget {
  const QRPage({Key? key}) : super(key: key);

  @override
  _QRPageState createState() => _QRPageState();
}

class _QRPageState extends State<QRPage> {
  ApiController apiController = Get.find();

  @override
  void initState() {
    apiController.qrCodeReq();
    apiController.sendDeviceToken();
    print('device token: ${apiController.deviceToken}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApiController>(
      builder: (_) => CustomScaffold(
        navBar: apiController.discountInt! >= 10
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
              ),
        showLeading: false,
        title: 'home',
        children: [
          apiController.loading && apiController.qrCode == 0
              ? Center(
                  child: CircleAvatar(
                      radius: 35.w,
                      backgroundColor: Colors.white.withOpacity(0.64),
                      child: Container(
                        padding: EdgeInsets.all(10.w),
                        height: 75.w,
                        width: 75.w,
                        child: const CircularProgressIndicator(
                          color: Colors.blueAccent,
                        ),
                      )),
                )
              : apiController.qrCode != 0
                  ? apiController.discount == true
                      ? Center(
                          child: Column(
                            children: [
                              SizedBox(height: 20.w),
                              SvgPicture.asset(
                                'assets/images/logotype.svg',
                                width: 100.w,
                              ),
                              SizedBox(height: 17.w),
                              QrImage(
                                data: apiController.qrCode.toString(),
                                version: QrVersions.auto,
                                foregroundColor: Colors.white,
                                size: 298.w,
                              ),
                              SizedBox(height: 25.w),
                              Text(
                                apiController.discountInt.toString() + '%',
                                style: TextStyle(
                                  fontFamily: 'BlissPro',
                                  fontSize: 48.sp,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'current_discount',
                                style: TextStyle(
                                  fontFamily: 'BlissPro',
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                ),
                              ).tr(),
                            ],
                          ),
                        )
                      : Center(
                          child: Column(
                            children: [
                              SizedBox(height: 20.w),
                              SvgPicture.asset(
                                'assets/images/logotype.svg',
                                width: 100.w,
                              ),
                              SizedBox(height: 17.w),
                              SizedBox(
                                height: 145.h,
                                width: 363.w,
                                child: BarcodeWidget(
                                  barcode: Barcode.ean13(),
                                  color: Colors.white,
                                  data: apiController.qrCode.toString(),
                                  // .substring(
                                  //     0,
                                  //     apiController.qrCode
                                  //             .toString()
                                  //             .length -
                                  //         1),
                                  style: TextStyle(
                                    fontFamily: 'BlissPro',
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white,
                                  ),
                                  errorBuilder: (context, error) => Center(
                                      child: Text(
                                    error,
                                    style: TextStyle(
                                      fontFamily: 'BlissPro',
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white,
                                    ),
                                  )),
                                ),
                              ),
                              SizedBox(height: 25.w),
                              Text(
                                apiController.discountInt.toString() + '%',
                                style: TextStyle(
                                  fontFamily: 'BlissPro',
                                  fontSize: 48.sp,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'current_discount',
                                style: TextStyle(
                                  fontFamily: 'BlissPro',
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                ),
                              ).tr(),
                            ],
                          ),
                        )
                  : const SizedBox(),
        ],
      ),
    );
  }
}
