import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vapeteka/presentation/widgets/nav_bar.dart';

class ChangeLanguageScreen extends StatefulWidget {
  const ChangeLanguageScreen({Key? key}) : super(key: key);

  @override
  _ChangeLanguageScreenState createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  bool language = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'settings',
          style: TextStyle(
              fontFamily: 'BlissPro',
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white),
        ).tr(),
        backgroundColor: const Color(0xFF333333),
      ),
      bottomNavigationBar: const CustomNavBar(),
      body: Container(
        width: 1.sw,
        height: 1.sh,
        margin: EdgeInsets.symmetric(horizontal: 14.w, vertical: 23.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          border: Border.all(
            width: 1.5.w,
            color: const Color(0xFF505050),
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 13.h),
            Text(
              'change_lng',
              style: TextStyle(
                  fontFamily: 'BlissPro',
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ).tr(),
            SizedBox(height: 25.h),
            ListTile(
              title: Text(
                'russian',
                style: TextStyle(
                    fontFamily: 'BlissPro',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ).tr(),
              leading: Radio<bool>(
                fillColor: MaterialStateProperty.all(Colors.white),
                value: true,
                groupValue: language,
                onChanged: (value) {
                  setState(() {
                    language = value!;
                    context.setLocale(const Locale('ru', 'RU'));
                  });
                },
              ),
            ),
            ListTile(
              title: Text(
                'english',
                style: TextStyle(
                    fontFamily: 'BlissPro',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ).tr(),
              leading: Radio<bool>(
                fillColor: MaterialStateProperty.all(Colors.white),
                value: false,
                groupValue: language,
                onChanged: (value) {
                  setState(() {
                    language = value!;
                    context.setLocale(const Locale('en', 'US'));
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
