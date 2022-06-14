import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
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

  void _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    apiController.qrCodeReq();
    apiController.sendDeviceToken();
    print('device token: ${apiController.deviceToken}');
    _refreshController.refreshCompleted();

  }

  void _onLoading() async {
    await Future.delayed(const Duration(milliseconds: 1000));

    if (mounted) {
      setState(() {
    });
    }
    _refreshController.loadComplete();
  }

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApiController>(
        builder: (_) => CustomScaffold(
          title: 'home',
            body: SmartRefresher(
              onRefresh: _onRefresh,
              onLoading: _onLoading,
              controller: _refreshController,
              child: ListView(
                children:[
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
                        child: ListView(
                          children: [
                            SizedBox(height: 20.h),
                            SvgPicture.asset(
                              'assets/images/logotype.svg',
                              width: 100.h,
                            ),
                            SizedBox(height: 17.h),
                            QrImage(
                              data: apiController.qrCode.toString(),
                              version: QrVersions.auto,
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.white,
                              size: 298.h,
                            ),
                            SizedBox(height: 25.h),
                            Text(
                              apiController.discountInt.toString() +
                                  '%',
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
                            SizedBox(height: 20.h),
                            SvgPicture.asset(
                              'assets/images/logotype.svg',
                              width: 100.h,
                            ),
                            SizedBox(height: 17.h),
                            QrImage(
                              data: apiController.qrCode.toString(),
                              version: QrVersions.auto,
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.white,
                              size: 298.h,
                            ),
                            SizedBox(height: 25.h),
                            Text(
                              apiController.discountInt.toString() +
                                  '%',
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
                : const SizedBox(),],
              ),
            )));
  }
}
