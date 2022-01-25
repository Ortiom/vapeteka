import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vapeteka/presentation/widgets/nav_bar.dart';
import 'package:vapeteka/services/shared_preferences.dart';
import 'package:vapeteka/translations/locale_keys.g.dart';

import '../../controllers/api_controller.dart';

class ChangeLanguageScreen extends StatefulWidget {
  const ChangeLanguageScreen({Key? key}) : super(key: key);

  @override
  _ChangeLanguageScreenState createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  late bool language;
  ApiController apiController = Get.find();

  @override
  void initState() {
    language = apiController.language;
    super.initState();
  }
  void _setLanguage(Locale locale) async {
    log(locale.toString(), name: toString());
    await context.setLocale(locale);
    await Get.updateLocale(locale);
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
                value: false,
                groupValue: language,
                onChanged: (value) {
                  _setLanguage(Locale('ru'));
                  setState(() {
                    language = value!;
                    apiController.language = value;
                    PreferencesService.setLngBool(!apiController.language);
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
                value: true,
                groupValue: language,
                onChanged: (value) {
                  _setLanguage(Locale('en'));
                  setState(() {
                    language = value!;
                    apiController.language = value;
                    PreferencesService.setLngBool(!apiController.language);
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
