import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vapeteka/controllers/api_controller.dart';
import 'package:vapeteka/presentation/widgets/buttons.dart';

class QRPage extends StatefulWidget {
  const QRPage({Key? key}) : super(key: key);

  @override
  _QRPageState createState() => _QRPageState();
}

class _QRPageState extends State<QRPage> {
  ApiController apiController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 20.w),
          SvgPicture.asset(
            'assets/images/logotype.svg',
            width: 100.w,
          ),
          SizedBox(height: 17.w),
          Image.asset(
            'assets/images/qrcode.png',
            width: 298.w,
          ),
          SizedBox(height: 17.w),
          Text(
            'Текущая скидка: 5%',
            style: GoogleFonts.roboto(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          GreenButton(
            label: 'asd',
            onPressed: () {
              apiController.qrCodeReq();
            },
          )
        ],
      ),
    );
  }
}
