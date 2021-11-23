import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vapeteka/domain/state/registration_state.dart';
import 'package:vapeteka/internal/dependencies/registration_module.dart';
import 'package:vapeteka/presentation/reg_with_card_screen.dart';
import 'package:vapeteka/presentation/registration_screen.dart';
import 'package:vapeteka/presentation/widgets/buttons.dart';
import 'package:vapeteka/presentation/widgets/inputs.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  RegController _homeState = Get.put(RegController());
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _homeState = HomeModule.regController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return Stack(
      children: [
        DecoratedBox(
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: SvgPicture.asset(
            'assets/images/frame.svg',
            fit: BoxFit.fill,
            width: 1.sw,
            height: 1.sh,
          ),
        ),
        Padding(
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
                label: 'Номер телефона',
                textInputType: TextInputType.phone,
              ),
              SizedBox(height: 27.5.w),
              PasswordTextField(
                controller: _passwordController,
                label: 'Пароль',
              ),
              SizedBox(height: 27.w),
              GreenButton(
                onPressed: () {},
                label: 'Войти',
                width: 79.w,
              ),
              SizedBox(height: 28.w),
              GrayButton(
                  label: 'Зарегистрироваться',
                  onPressed: () {
                    Get.to(() => const RegistrationScreen());
                  }),
              SizedBox(height: 16.w),
              GrayButton(
                  label: 'У меня есть карта',
                  onPressed: () {
                    Get.to(() => const RegWithCardScreen());
                  }),
            ],
          ),
        ),
      ],
    );
  }
}
