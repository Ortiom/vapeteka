import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:vapeteka/constants/tr_consts.dart';
import 'package:vapeteka/controllers/api_controller.dart';
import 'package:vapeteka/models/login_models/login.dart';
import 'package:vapeteka/presentation/pages/qr_page.dart';
import 'package:vapeteka/presentation/pages/registration_screen.dart';
import 'package:vapeteka/presentation/widgets/inputs.dart';
import 'package:vapeteka/services/response_result.dart';

import '../widgets/buttons.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  ApiController apiController = Get.find();
  bool loading = false;
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  var maskFormatter = MaskTextInputFormatter(
    mask: '(###) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
  );

  @override
  void initState() {
    // _phoneController.text = '';
    // _passwordController.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(child: _getBody()),
    );
  }

  Widget _getBody() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          child: Image.asset(
            'assets/images/frame.png',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 37.w, vertical: 20.h),
          child: Column(
            children: [
              Center(
                child: SvgPicture.asset(
                  'assets/images/logotype.svg',
                  width: 213.w,
                ),
              ),
              SizedBox(height: 50.w),
              LoginTextField(
                prefix: '+7 ',
                formatter: maskFormatter,
                controller: _phoneController,
                label: 'phone_number',
                textInputType: const TextInputType.numberWithOptions(
                    signed: true, decimal: true),
              ),
              SizedBox(height: 27.5.w),
              PasswordTextField(
                controller: _passwordController,
                label: 'password',
              ),
              SizedBox(height: 27.w),
              GreenButton(
                onPressed: () {
                  postData();
                },
                isLoading: loading,
                label: 'enter',
              ),
              SizedBox(height: 28.w),
              GrayButton(
                  label: 'register',
                  onPressed: () {
                    Get.to(() => const RegistrationScreen());
                  }),
              // SizedBox(height: 16.w),
              // GrayButton(
              //     label: 'register_card',
              //     onPressed: () {
              //       Get.to(() => const RegWithCardScreen());
              //     }),
            ],
          ),
        ),
      ],
    );
  }

  Future postData() async {
    loading = true;
    setState(() {});
    Login login = Login(
      phoneNumber: '7' + maskFormatter.getUnmaskedText(),
      password: _passwordController.text,
    );

    await apiController.loginReq(login).then((value) async {
      if (value.status == Status.success) {
        loading = false;
        setState(() {});
        Get.snackbar(auth_success, '',
            backgroundColor: Colors.green,
            colorText: Colors.white,
            duration: 4.seconds);
        Get.offAll(() => const QRPage());
      } else {
        loading = false;
        setState(() {});
        Get.snackbar(error, value.errorText.toString(),
            backgroundColor: Colors.redAccent,
            colorText: Colors.white,
            duration: 4.seconds);
      }
    });
  }
}
