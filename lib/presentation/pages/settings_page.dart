import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vapeteka/controllers/api_controller.dart';
import 'package:vapeteka/presentation/pages/welcome_screen.dart';
import 'package:vapeteka/presentation/widgets/buttons.dart';
import 'package:vapeteka/services/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  ApiController apiController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w),
      child: Column(
        children: [
          CatalogItemButton(
            title: 'Сменить язык',
            onPressed: () {},
          ),
          CatalogItemButton(
            title: 'Помощь',
            onPressed: () {},
          ),
          CatalogItemButton(
            title: 'Выход',
            onPressed: () {
              PreferencesService.setToken('');
              apiController.qrCode = 0;
              Get.to(() => const WelcomeScreen());
            },
          ),
        ],
      ),
    );
  }
}
