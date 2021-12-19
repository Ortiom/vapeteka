import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vapeteka/controllers/api_controller.dart';
import 'package:vapeteka/presentation/pages/welcome_screen.dart';
import 'package:vapeteka/presentation/widgets/nav_bar.dart';
import 'package:vapeteka/services/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  ApiController apiController = Get.find();
  bool isUserIn = false;

  void getUser() async {
    apiController.loading = true;
    String token;
    token = PreferencesService.getToken();
    apiController.token = token;

    await apiController.qrCodeReq().then((value) {
      if (value.data != null && apiController.qrCode != 0) {
        isUserIn = true;
        Get.to(() => const NavBarPage());
      } else if (value.errorText != null && apiController.qrCode == 0) {
        isUserIn = true;
        Get.to(() => const WelcomeScreen());
      }
    });
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      body: GetBuilder<ApiController>(
          builder: (_) => apiController.loading == true
              ? Center(
                  child: CircleAvatar(
                      radius: 35.w,
                      backgroundColor: Colors.white.withOpacity(0.64),
                      child: Container(
                        padding: EdgeInsets.all(10.w),
                        height: 75.w,
                        width: 75.w,
                        child: const CircularProgressIndicator(
                          color: Colors.blueAccent,
                        ),
                      )),
                )
              : isUserIn == false
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Упс! Проблмы с сетью',
                          style: GoogleFonts.roboto(
                              fontSize: 22.w, color: Colors.white),
                        ),
                        SizedBox(height: 200.h),
                        Padding(
                          padding: EdgeInsets.only(bottom: 50.h),
                          child: Center(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: const StadiumBorder(),
                                    primary: const Color(0xFF105A89)
                                        .withOpacity(0.84)),
                                onPressed: () {
                                  getUser();
                                },
                                child: const Text('Попробовать снова')),
                          ),
                        ),
                      ],
                    )
                  : const SizedBox()),
    );
  }
}