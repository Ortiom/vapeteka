import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vapeteka/controllers/api_controller.dart';
import 'package:vapeteka/presentation/widgets/nav_bar.dart';
import 'package:vapeteka/services/shared_preferences.dart';

class ChangeDiscountScreen extends StatefulWidget {
  const ChangeDiscountScreen({Key? key}) : super(key: key);

  @override
  _ChangeDiscountScreenState createState() => _ChangeDiscountScreenState();
}

class _ChangeDiscountScreenState extends State<ChangeDiscountScreen> {
  ApiController apiController = Get.find();
  late bool discount;

  @override
  void initState() {
    discount = apiController.discount;
    super.initState();
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
                'code_type',
                style: TextStyle(
                    fontFamily: 'BlissPro',
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ).tr(),
              SizedBox(height: 25.h),
              RadioListTile<bool>(
                groupValue: discount,
                activeColor: Colors.white,
                value: false,
                title: Text(
                  'barcode',
                  style: TextStyle(
                      fontFamily: 'BlissPro',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ).tr(),
                onChanged: (value) {
                  setState(() {
                    discount = value!;
                    apiController.discount = value;
                    PreferencesService.setDiscountBool(discount);
                    // print(apiController.discount);
                  });
                },
              ),
              RadioListTile<bool>(
                groupValue: discount,
                activeColor: Colors.white,
                value: true,
                onChanged: (value) {
                  setState(() {
                    discount = value!;
                    apiController.discount = value;
                    PreferencesService.setDiscountBool(discount);
                    // print(apiController.discount);
                  });
                },
                title: Text(
                  'qr_code',
                  style: TextStyle(
                      fontFamily: 'BlissPro',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ).tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
