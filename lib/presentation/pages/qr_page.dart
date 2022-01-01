import 'package:barcode_widget/barcode_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:vapeteka/controllers/api_controller.dart';
import 'package:vapeteka/presentation/widgets/nav_bar.dart';

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
                                '5%',
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
                              // SizedBox(
                              //   height: 145.h,
                              //   child: SfBarcodeGenerator(
                              //     barColor: Colors.white,
                              //     value: apiController.qrCode.toString(),
                              //     symbology: EAN13(),
                              //     //showValue: true,
                              //   ),
                              // ),
                              SizedBox(
                                height: 145.h,
                                width: 363.w,
                                child: BarcodeWidget(
                                  barcode: Barcode.ean13(),
                                  color: Colors.white,
                                  data: apiController.qrCode
                                      .toString()
                                      .substring(
                                          0,
                                          apiController.qrCode
                                                  .toString()
                                                  .length -
                                              1),
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
                                '5%',
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
