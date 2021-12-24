import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vapeteka/controllers/api_controller.dart';
import 'package:vapeteka/presentation/pages/change_language_page.dart';
import 'package:vapeteka/presentation/pages/welcome_screen.dart';
import 'package:vapeteka/presentation/widgets/buttons.dart';
import 'package:vapeteka/presentation/widgets/nav_bar.dart';
import 'package:vapeteka/services/shared_preferences.dart';

import 'change_discount_screen.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  ApiController apiController = Get.find();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApiController>(
      builder: (_) => CustomScaffold(
        showLeading: false,
        title: 'Настройки',
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: Column(
              children: [
                CatalogItemButton(
                  title: 'Тип кода',
                  onPressed: () {
                    Get.to(() => const ChangeDiscountScreen());
                  },
                ),
                CatalogItemButton(
                  title: 'Сменить язык',
                  onPressed: () {
                    Get.to(() => const ChangeLanguageScreen());
                  },
                ),
                CatalogItemButton(
                  title: 'Выход',
                  onPressed: () {
                    apiController.logOut();
                    PreferencesService.setToken('');
                    apiController.qrCode = 0;
                    Get.to(() => const WelcomeScreen());
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
