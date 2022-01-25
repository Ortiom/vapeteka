import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vapeteka/presentation/widgets/buttons.dart';
import 'package:vapeteka/presentation/widgets/nav_bar.dart';
import 'package:vapeteka/translations/locale_keys.g.dart';

import 'catalog_page.dart';

class CompleteOrderScreen extends StatelessWidget {
  const CompleteOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Корзина',
          style: TextStyle(
              fontFamily: 'BlissPro',
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white),
        ),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              LocaleKeys.order_created,
              style: TextStyle(
                fontFamily: 'BlissPro',
                fontSize: 24.sp,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ).tr(),
            SizedBox(height: 16.h),
            Text(
              LocaleKeys.order_details,
              // 'Наши сотрудники свяжутся с Вами по\n контактному телефону для согласования\n заказа и уточнения условий доставки.',
              style: TextStyle(
                fontFamily: 'BlissPro',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Colors.white,
                height: 1.8.w,
              ),
              textAlign: TextAlign.center,
            ).tr(),
            SizedBox(height: 16.h),
            GreenButton(
              label: 'great',
              onPressed: () {
                Get.to(() => const CatalogPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}
