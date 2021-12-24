import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vapeteka/controllers/api_controller.dart';
import 'package:vapeteka/models/login_models/register_with_card.dart';
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
                  controller: _phoneController,
                  label: 'Номер телефона',
                  textInputType: TextInputType.phone,
                ),
                SizedBox(height: 19.w),
                LoginTextField(
                  controller: _qrCodeController,
                  label: 'Введите номер карты',
                ),
                SizedBox(height: 19.w),
                PasswordTextField(
                  controller: _passwordController,
                  label: 'Пароль',
                ),
                SizedBox(height: 19.w),
                PasswordTextField(
                  controller: _passwordConfirmController,
                  label: 'Повторите пароль',
                ),
                SizedBox(height: 19.w),
                BirthTextField(
                  controller: _birthdayController,
                  label: 'Дата рождения',
                  textInputType: TextInputType.phone,
                ),
                SizedBox(height: 23.w),
                GreenButton(
                  label: 'зарегистрироваться'.toUpperCase(),
                  onPressed: () {},
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
      phoneNumber: _phoneController.text,
      password: _passwordController.text,
      passConfirm: _passwordConfirmController.text,
      qrCode: _qrCodeController.text,
      birthday: _birthdayController.text,
    );

    await apiController
        .registrationWithCardReq(regWithCard)
        .then((value) async {
      if (value.status == Status.success) {
        Get.snackbar('Авторизация прошла успешно', '',
            backgroundColor: Colors.green,
            colorText: Colors.white,
            duration: 4.seconds);
      } else {
        Get.snackbar('Ошибка', value.errorText.toString(),
            backgroundColor: Colors.redAccent,
            colorText: Colors.white,
            duration: 4.seconds);
      }
    });
  }
}
