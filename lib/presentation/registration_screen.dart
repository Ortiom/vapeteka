import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vapeteka/presentation/widgets/buttons.dart';
import 'package:vapeteka/presentation/widgets/inputs.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
                  controller: _phoneController,
                  label: 'Имя',
                  textInputType: TextInputType.phone,
                ),
                SizedBox(height: 19.w),
                LoginTextField(
                  controller: _phoneController,
                  label: 'Фамилия',
                  textInputType: TextInputType.phone,
                ),
                SizedBox(height: 19.w),
                LoginTextField(
                  controller: _phoneController,
                  label: 'Отчество',
                  textInputType: TextInputType.phone,
                ),
                SizedBox(height: 19.w),
                PasswordTextField(
                  controller: _passwordController,
                  label: 'Пароль',
                ),
                SizedBox(height: 19.w),
                PasswordTextField(
                  controller: _passwordController,
                  label: 'Повторите пароль',
                ),
                SizedBox(height: 19.w),
                LoginTextField(
                  controller: _phoneController,
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
}
