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
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Настройки',
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
          children: [
            SizedBox(height: 13.h),
            Text(
              'Тип кода',
              style: TextStyle(
                  fontFamily: 'BlissPro',
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            SizedBox(height: 25.h),
            ListTile(
              title: Text(
                'Штрих код',
                style: TextStyle(
                    fontFamily: 'BlissPro',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              leading: Radio<bool>(
                fillColor: MaterialStateProperty.all(Colors.white),
                value: false,
                groupValue: discount,
                onChanged: (value) {
                  setState(() {
                    discount = value!;
                    apiController.discount = value;
                    PreferencesService.setDiscountBool(!apiController.discount);
                  });
                },
              ),
            ),
            ListTile(
              title: Text(
                'QR код',
                style: TextStyle(
                    fontFamily: 'BlissPro',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              leading: Radio<bool>(
                fillColor: MaterialStateProperty.all(Colors.white),
                value: true,
                groupValue: discount,
                onChanged: (value) {
                  setState(() {
                    discount = value!;
                    apiController.discount = value;
                    PreferencesService.setDiscountBool(!apiController.discount);
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
