import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
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
      style: GoogleFonts.roboto(fontSize: 16.sp, color: Colors.white),
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
        labelStyle: GoogleFonts.roboto(
            fontWeight: FontWeight.w400, fontSize: 18.sp, color: Colors.white),
        floatingLabelStyle: GoogleFonts.roboto(
            fontWeight: FontWeight.w400, fontSize: 18.sp, color: Colors.white),
        label: Text(
          widget.label!,
        ),
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
      style: GoogleFonts.roboto(fontSize: 16.sp, color: Colors.white),
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
        labelStyle: GoogleFonts.roboto(
            fontWeight: FontWeight.w400, fontSize: 18.sp, color: Colors.white),
        floatingLabelStyle: GoogleFonts.roboto(
            fontWeight: FontWeight.w400, fontSize: 18.sp, color: Colors.white),
        label: Text(
          widget.label!,
        ),
      ),
    );
  }
}
