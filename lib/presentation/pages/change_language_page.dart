import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vapeteka/controllers/api_controller.dart';
import 'package:vapeteka/presentation/widgets/nav_bar.dart';
import 'package:vapeteka/services/shared_preferences.dart';

class ChangeLanguageScreen extends StatefulWidget {
  const ChangeLanguageScreen({Key? key}) : super(key: key);

  @override
  _ChangeLanguageScreenState createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  ApiController apiController = Get.find();
  late bool language;

  @override
  void initState() {
    language = apiController.language;
    super.initState();
  }

  void _setLanguage(Locale locale) async {
    log(locale.toString(), name: toString());
    await context.setLocale(locale);
    await Get.updateLocale(locale);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getBool('language').toString());
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'settings',
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
        child: Theme(
          data: Theme.of(context).copyWith(
              unselectedWidgetColor: Colors.white, disabledColor: Colors.white),
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
              RadioListTile<bool>(
                activeColor: Colors.white,
                title: Text(
                  'russian',
                  style: TextStyle(
                      fontFamily: 'BlissPro',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ).tr(),
                value: false,
                groupValue: language,
                onChanged: (value) {
                  setState(() {
                    language = value!;
                    apiController.language = value;
                    PreferencesService.setLngBool(language);
                    // print(apiController.language);
                  });
                  _setLanguage(const Locale('ru'));
                },
              ),
              RadioListTile<bool>(
                activeColor: Colors.white,
                title: Text(
                  'english',
                  style: TextStyle(
                      fontFamily: 'BlissPro',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ).tr(),
                value: true,
                groupValue: language,
                onChanged: (value) {
                  setState(() {
                    language = value!;
                    apiController.language = value;
                    PreferencesService.setLngBool(language);
                    // print(apiController.language);
                  });
                  _setLanguage(const Locale('en'));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
