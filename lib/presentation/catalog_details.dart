import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CatalogDetails extends StatefulWidget {
  const CatalogDetails({Key? key}) : super(key: key);

  @override
  _CatalogDetailsState createState() => _CatalogDetailsState();
}

class _CatalogDetailsState extends State<CatalogDetails> {
  List<String> images = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/frame.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            'Товары',
            style: GoogleFonts.roboto(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: Colors.white),
          ),
          backgroundColor: const Color(0xFF333333),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset('assets/images/first.png', width: 171.w),
                  Image.asset('assets/images/second.png', width: 171.w),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset('assets/images/third.png', width: 171.w),
                  Image.asset('assets/images/fourth.png', width: 171.w),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
