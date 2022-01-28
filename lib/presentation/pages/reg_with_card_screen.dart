import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:vapeteka/constants/tr_consts.dart';
import 'package:vapeteka/controllers/api_controller.dart';
import 'package:vapeteka/models/login_models/register_with_card.dart';
import 'package:vapeteka/presentation/pages/sms_code_screen.dart';
import 'package:vapeteka/presentation/widgets/buttons.dart';
import 'package:vapeteka/presentation/widgets/inputs.dart';
import 'package:vapeteka/services/response_result.dart';

class RegWithCardScreen extends StatefulWidget {
  const RegWithCardScreen({Key? key}) : super(key: key);

  @override
  _RegWithCardScreenState createState() => _RegWithCardScreenState();
}

class _RegWithCardScreenState extends State<RegWithCardScreen> {
  ApiController apiController = Get.find();

  final TextEditingController _qrCodeController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  var maskFormatter = MaskTextInputFormatter(
    mask: '(###) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
  );

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
                SizedBox(height: 19.w),
                LoginTextField(
                  formatter: maskFormatter,
                  prefix: '+7 ',
                  controller: _phoneController,
                  label: 'phone_number',
                  textInputType: TextInputType.phone,
                ),
                SizedBox(height: 19.w),
                LoginTextField(
                  controller: _qrCodeController,
                  label: 'card_number',
                ),
                SizedBox(height: 19.w),
                PasswordTextField(
                  controller: _passwordController,
                  label: 'password',
                ),
                SizedBox(height: 19.w),
                PasswordTextField(
                  controller: _passwordConfirmController,
                  label: 'repeat_password',
                ),
                SizedBox(height: 19.w),
                BirthTextField(
                  controller: _birthdayController,
                  label: 'birthdate',
                  textInputType: TextInputType.phone,
                ),
                SizedBox(height: 23.w),
                GreenButton(
                  label: 'register',
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
    RegWithCard regWithCard = RegWithCard(
      phoneNumber: '7' + maskFormatter.getUnmaskedText(),
      password: _passwordController.text,
      passConfirm: _passwordConfirmController.text,
      qrCode: _qrCodeController.text,
      birthday: _birthdayController.text,
    );

    await apiController
        .registrationWithCardReq(regWithCard)
        .then((value) async {
      if (value.status == Status.success) {
        Get.snackbar(auth_success, '',
            backgroundColor: Colors.green,
            colorText: Colors.white,
            duration: 4.seconds);
        Get.to(()=> const SmsCodeScreen());
      } else {
        Get.snackbar(error, value.errorText.toString(),
            backgroundColor: Colors.redAccent,
            colorText: Colors.white,
            duration: 4.seconds);
      }
    });
  }
}
