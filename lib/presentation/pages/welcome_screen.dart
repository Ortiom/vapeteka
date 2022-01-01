import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vapeteka/controllers/api_controller.dart';
import 'package:vapeteka/models/login_models/login.dart';
import 'package:vapeteka/presentation/pages/qr_page.dart';
import 'package:vapeteka/presentation/pages/reg_with_card_screen.dart';
import 'package:vapeteka/presentation/pages/registration_screen.dart';
import 'package:vapeteka/presentation/widgets/buttons.dart';
import 'package:vapeteka/presentation/widgets/inputs.dart';
import 'package:vapeteka/services/response_result.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  ApiController apiController = Get.find();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    _phoneController.text = '77474991201';
    _passwordController.text = '1';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/frame.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(child: _getBody()),
      ),
    );
  }

  Widget _getBody() {
    return Padding(
      padding: EdgeInsets.only(top: 160.w, left: 36.w, right: 36.w),
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/images/logotype.svg',
            width: 213.w,
          ),
          SizedBox(height: 50.w),
          LoginTextField(
            controller: _phoneController,
            label: 'phone_number',
            textInputType: TextInputType.phone,
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
              //Get.to(() => const NavBarPage());
            },
            label: 'enter',
          ),
          SizedBox(height: 28.w),
          GrayButton(
              label: 'register',
              onPressed: () {
                Get.to(() => const RegistrationScreen());
              }),
          SizedBox(height: 16.w),
          GrayButton(
              label: 'register_card',
              onPressed: () {
                Get.to(() => const RegWithCardScreen());
              }),
        ],
      ),
    );
  }

  Future postData() async {
    Login login = Login(
      phoneNumber: _phoneController.text,
      password: _passwordController.text,
    );

    await apiController.loginReq(login).then((value) async {
      if (value.status == Status.success) {
        Get.snackbar('Авторизация прошла успешно', '',
            backgroundColor: Colors.green,
            colorText: Colors.white,
            duration: 4.seconds);
        Get.to(() => const QRPage());
      } else {
        Get.snackbar('Ошибка', value.errorText.toString(),
            backgroundColor: Colors.redAccent,
            colorText: Colors.white,
            duration: 4.seconds);
      }
    });
  }
}
