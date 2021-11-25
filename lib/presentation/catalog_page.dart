import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vapeteka/presentation/widgets/buttons.dart';

import 'catalog_details.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  _CatalogPageState createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w),
      child: Column(
        children: [
          CatalogItemButton(
            title: 'Девайсы',
            onPressed: () {
              Get.to(() => const CatalogDetails());
            },
          ),
          CatalogItemButton(
            title: 'Атомайзеры',
            onPressed: () {
              Get.to(() => const CatalogDetails());
            },
          ),
          CatalogItemButton(
            title: 'Аксессуары',
            onPressed: () {
              Get.to(() => const CatalogDetails());
            },
          ),
          CatalogItemButton(
            title: 'Жидкости',
            onPressed: () {
              Get.to(() => const CatalogDetails());
            },
          ),
        ],
      ),
    );
  }
}
