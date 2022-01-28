import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vapeteka/constants/tr_consts.dart';
import 'package:vapeteka/controllers/api_controller.dart';
import 'package:vapeteka/models/login_models/sms_code.dart';
import 'package:vapeteka/presentation/pages/qr_page.dart';
import 'package:vapeteka/presentation/widgets/buttons.dart';
import 'package:vapeteka/presentation/widgets/inputs.dart';
import 'package:vapeteka/presentation/widgets/nav_bar.dart';
import 'package:vapeteka/services/response_result.dart';

class SmsCodeScreen extends StatefulWidget {
  const SmsCodeScreen({Key? key}) : super(key: key);

  @override
  _SmsCodeScreenState createState() => _SmsCodeScreenState();
}

class _SmsCodeScreenState extends State<SmsCodeScreen> {
  ApiController apiController = Get.find();

  final TextEditingController _smsCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(2, 0, 0, 0),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 42.w, vertical: 10.w),
            child: Column(
              children: [
                SvgPicture.asset(
                  'assets/images/logotype.svg',
                  width: 100.w,
                ),
                SizedBox(
                  height: 215.h,
                ),
                SizedBox(height: 19.w),
                LoginTextField(
                  controller: _smsCodeController,
                  label: 'code',
                  textInputType: TextInputType.number,
                ),
                SizedBox(height: 23.w),
                GreenButton(
                  label: 'check_sms',
                  onPressed: () {
                    postData();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future postData() async {
    SmsCode smsCode = SmsCode(
      code: _smsCodeController.text,
      phoneNumber: apiController.number,
    );

    await apiController.smsCodeReq(smsCode).then((value) async {
      if (value.status == Status.success) {
        Get.snackbar(check_success, '',
            backgroundColor: Colors.green,
            colorText: Colors.white,
            duration: 4.seconds);
        Get.to(() => const QRPage());
      } else {
        Get.snackbar(error, value.errorText.toString(),
            backgroundColor: Colors.redAccent,
            colorText: Colors.white,
            duration: 4.seconds);
      }
    });
  }
}
