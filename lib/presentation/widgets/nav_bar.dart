import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vapeteka/presentation/catalog_page.dart';
import 'package:vapeteka/presentation/promotion_page.dart';
import 'package:vapeteka/presentation/settings_page.dart';

import '../qr_page.dart';

class NavBarPage extends StatefulWidget {
  const NavBarPage({Key? key}) : super(key: key);

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> {
  final List<Widget> _pages = [
    const QRPage(),
    const CatalogPage(),
    const PromotionPage(),
    const SettingsPage(),
  ];

  final List<String> _titles = [
    'Главная',
    'Каталог',
    'Акции',
    'Настройки',
  ];

  int? currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          _titles[currentIndex!],
          style: GoogleFonts.roboto(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white),
        ),
        backgroundColor: const Color(0xFF333333),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: IndexedStack(
            index: currentIndex,
            children: _pages,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex!,
        showUnselectedLabels: true,
        iconSize: 24.w,
        backgroundColor: const Color(0xFF333333),
        selectedLabelStyle: TextStyle(fontSize: ScreenUtil().setSp(12)),
        unselectedLabelStyle: TextStyle(fontSize: ScreenUtil().setSp(12)),
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.crop_free,
              color: Colors.white,
            ),
            label: 'QR',
            backgroundColor: Color(0xFF333333),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.store_outlined,
              color: Colors.white,
            ),
            label: 'Каталог',
            backgroundColor: Color(0xFF333333),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.info_outlined,
              color: Colors.white,
            ),
            label: 'Акции',
            backgroundColor: Color(0xFF333333),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings_outlined,
              color: Colors.white,
            ),
            label: 'Настройки',
            backgroundColor: Color(0xFF333333),
          ),
        ],
      ),
    );
  }
}
