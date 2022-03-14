import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vapeteka/controllers/api_controller.dart';
import 'package:vapeteka/presentation/pages/change_language_page.dart';
import 'package:vapeteka/presentation/pages/welcome_screen.dart';
import 'package:vapeteka/presentation/widgets/buttons.dart';
import 'package:vapeteka/presentation/widgets/nav_bar.dart';
import 'package:vapeteka/services/shared_preferences.dart';

import '../../constants/tr_consts.dart';
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
        title: 'settings',
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: Column(
              children: [
                CatalogItemButton(
                  title: 'code_type',
                  onPressed: () {
                    Get.to(() => const ChangeDiscountScreen());
                  },
                ),
                CatalogItemButton(
                  title: 'change_lng',
                  onPressed: () {
                    Get.to(() => ChangeLanguageScreen());
                  },
                ),
                CatalogItemButton(
                  title: 'exit',
                  onPressed: () {
                    apiController.logOut();
                    PreferencesService.setToken('');
                    apiController.qrCode = 0;
                    Get.to(() => const WelcomeScreen());
                  },
                ),
                CatalogItemButton(
                  title: 'delete_acc',
                  onPressed: () {
                    Get.defaultDialog(
                      backgroundColor: const Color(0xFF333333),
                      contentPadding: const EdgeInsets.all(16),
                      titlePadding: const EdgeInsets.symmetric(vertical: 10),
                      title: confirm_action,
                      content: const Text(
                        'acc_info',
                        style: TextStyle(color: Colors.white),
                      ).tr(),
                      titleStyle: const TextStyle(color: Colors.white),
                      cancel: TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          'cancel',
                          style: TextStyle(color: Colors.red, fontSize: 18.sp),
                        ).tr(),
                      ),
                      confirm: TextButton(
                        onPressed: () {
                          apiController
                              .deleteAccReq()
                              .then((value) => print([value.data.toString()]));
                          PreferencesService.setToken(' ');
                          apiController.qrCode = 0;
                          Get.to(() => const WelcomeScreen());
                        },
                        child: Text(
                          'confirm',
                          style: TextStyle(
                              color: Color(0xFF27AE60), fontSize: 18.sp),
                        ).tr(),
                      ),
                    );
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
// Get.dialog(AlertDialog(
//  backgroundColor: Color(0xFF333333),
//   content: Column(
//     children: [
//       Text('')
//     ],
//   )
// ));
