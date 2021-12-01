import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vapeteka/controllers/api_controller.dart';
import 'package:vapeteka/models/login_models/register.dart';
import 'package:vapeteka/presentation/pages/sms_code_screen.dart';
import 'package:vapeteka/presentation/widgets/buttons.dart';
import 'package:vapeteka/presentation/widgets/inputs.dart';
import 'package:vapeteka/services/response_result.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  ApiController apiController = Get.find();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _middleNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 0, 0, 2),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 42.w, vertical: 10.w),
            child: Column(
              children: [
                SvgPicture.asset(
                  'assets/images/logotype.svg',
                  width: 75.w,
                ),
                SizedBox(height: 19.w),
                LoginTextField(
                  controller: _phoneController,
                  label: 'Номер телефона',
                  textInputType: TextInputType.phone,
                ),
                SizedBox(height: 19.w),
                LoginTextField(
                  controller: _firstNameController,
                  label: 'Имя',
                  textInputType: TextInputType.text,
                ),
                SizedBox(height: 19.w),
                LoginTextField(
                  controller: _lastNameController,
                  label: 'Фамилия',
                  textInputType: TextInputType.text,
                ),
                SizedBox(height: 19.w),
                LoginTextField(
                  controller: _middleNameController,
                  label: 'Отчество',
                  textInputType: TextInputType.text,
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
                LoginTextField(
                  controller: _birthdayController,
                  label: 'Дата рождения',
                  textInputType: TextInputType.phone,
                ),
                SizedBox(height: 23.w),
                GreenButton(
                  label: 'зарегистрироваться'.toUpperCase(),
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
    Register register = Register(
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      middleName: _middleNameController.text,
      password: _passwordController.text,
      passConfirm: _passwordConfirmController.text,
      phoneNumber: _phoneController.text,
      birthday: _birthdayController.text,
    );

    await apiController.registration(register).then((value) async {
      if (value.status == Status.success) {
        Get.snackbar('Регистрация прошла успешно', '',
            backgroundColor: Colors.green,
            colorText: Colors.white,
            duration: 4.seconds);
        Get.to(() => const SmsCodeScreen());
      } else {
        Get.snackbar('Ошибка', value.errorText.toString(),
            backgroundColor: Colors.redAccent,
            colorText: Colors.white,
            duration: 4.seconds);
      }
    });
  }
}
