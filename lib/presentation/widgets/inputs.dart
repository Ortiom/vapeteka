import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    Key? key,
    this.label,
    this.controller,
  }) : super(key: key);

  final String? label;
  final TextEditingController? controller;

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool? _passVisible;

  @override
  void initState() {
    _passVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _passVisible!,
      style: TextStyle(
          fontFamily: 'BlissPro', fontSize: 16.sp, color: Colors.white),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.w,
            color: Colors.grey.withOpacity(0.20),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.w,
            color: Colors.grey.withOpacity(0.20),
          ),
        ),
        labelStyle: TextStyle(
            fontFamily: 'BlissPro',
            fontWeight: FontWeight.w400,
            fontSize: 18.sp,
            color: Colors.white),
        floatingLabelStyle: TextStyle(
            fontFamily: 'BlissPro',
            fontWeight: FontWeight.w400,
            fontSize: 18.sp,
            color: Colors.white),
        label: Text(
          widget.label!,
        ).tr(),
        suffixIcon: IconButton(
          icon: Icon(
            _passVisible! ? Icons.visibility : Icons.visibility_off,
            color: Colors.white,
          ),
          onPressed: () => setState(() {
            _passVisible = !_passVisible!;
          }),
        ),
      ),
    );
  }
}

class LoginTextField extends StatefulWidget {
  const LoginTextField({
    Key? key,
    this.label,
    this.textInputType,
    this.controller,
    this.formatter,
  }) : super(key: key);

  final String? label;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final MaskTextInputFormatter? formatter;

  @override
  _LoginTextFieldState createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [widget.formatter ?? MaskTextInputFormatter()],
      controller: widget.controller,
      keyboardType: widget.textInputType ?? TextInputType.text,
      style: TextStyle(
          fontFamily: 'BlissPro', fontSize: 16.sp, color: Colors.white),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.w,
            color: Colors.grey.withOpacity(0.20),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.w,
            color: Colors.grey.withOpacity(0.20),
          ),
        ),
        labelStyle: TextStyle(
            fontFamily: 'BlissPro',
            fontWeight: FontWeight.w400,
            fontSize: 18.sp,
            color: Colors.white),
        floatingLabelStyle: TextStyle(
            fontFamily: 'BlissPro',
            fontWeight: FontWeight.w400,
            fontSize: 18.sp,
            color: Colors.white),
        label: Text(
          widget.label!,
        ).tr(),
      ),
    );
  }
}

class DateTextFormatter extends TextInputFormatter {
  static const _maxChars = 8;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = _format(newValue.text, '/');
    return newValue.copyWith(text: text, selection: updateCursorPosition(text));
  }

  String _format(String value, String seperator) {
    value = value.replaceAll(seperator, '');
    var newString = '';

    for (int i = 0; i < min(value.length, _maxChars); i++) {
      newString += value[i];
      if ((i == 1 || i == 3) && i != value.length - 1) {
        newString += seperator;
      }
    }

    return newString;
  }

  TextSelection updateCursorPosition(String text) {
    return TextSelection.fromPosition(TextPosition(offset: text.length));
  }
}

class BirthTextField extends StatefulWidget {
  const BirthTextField({
    Key? key,
    this.label,
    this.textInputType,
    this.controller,
  }) : super(key: key);

  final String? label;
  final TextInputType? textInputType;
  final TextEditingController? controller;

  @override
  _BirthTextFieldState createState() => _BirthTextFieldState();
}

class _BirthTextFieldState extends State<BirthTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [DateTextFormatter()],
      controller: widget.controller,
      keyboardType: widget.textInputType ?? TextInputType.text,
      style: TextStyle(
          fontFamily: 'BlissPro', fontSize: 16.sp, color: Colors.white),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.w,
            color: Colors.grey.withOpacity(0.20),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.w,
            color: Colors.grey.withOpacity(0.20),
          ),
        ),
        labelStyle: TextStyle(
            fontFamily: 'BlissPro',
            fontWeight: FontWeight.w400,
            fontSize: 18.sp,
            color: Colors.white),
        floatingLabelStyle: TextStyle(
            fontFamily: 'BlissPro',
            fontWeight: FontWeight.w400,
            fontSize: 18.sp,
            color: Colors.white),
        label: Text(
          widget.label!,
        ).tr(),
      ),
    );
  }
}
