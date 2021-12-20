import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:vapeteka/controllers/api_controller.dart';
import 'package:vapeteka/presentation/widgets/nav_bar.dart';

class PromotionPage extends StatefulWidget {
  const PromotionPage({Key? key}) : super(key: key);

  @override
  _PromotionPageState createState() => _PromotionPageState();
}

class _PromotionPageState extends State<PromotionPage> {
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
        title: 'Акции',
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
                  ? Center(
                      child: Column(
                        children: [
                          SizedBox(height: 20.w),
                          SvgPicture.asset(
                            'assets/images/logotype.svg',
                            width: 100.w,
                          ),
                          SizedBox(height: 17.w),
                          DecoratedBox(
                            decoration:
                                const BoxDecoration(color: Colors.white),
                            child: QrImage(
                              data: apiController.qrCode.toString(),
                              version: QrVersions.auto,
                              size: 298.w,
                            ),
                          ),
                          SizedBox(height: 17.w),
                          Text(
                            'Текущая скидка: 5%',
                            style: GoogleFonts.roboto(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox(),
        ],
      ),
    );
  }
}
