import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vapeteka/presentation/widgets/buttons.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
        ],
      ),
    );
  }
}
