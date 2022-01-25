import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GreenButton extends StatelessWidget {
  const GreenButton({
    Key? key,
    this.onPressed,
    this.label,
    this.fonSize,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String? label;
  final double? fonSize;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      color: const Color(0xFF27AE60),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      onPressed: onPressed,
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.w),
      child: Text(
        label!,
        style: TextStyle(
          fontFamily: 'BlissPro',
          fontSize: fonSize ?? 16.sp,
          fontWeight: FontWeight.w400,
          color: Colors.white,
          letterSpacing: 1.25.w,
        ),
      ).tr(),
    );
  }
}

class GrayButton extends StatelessWidget {
  const GrayButton({
    Key? key,
    this.onPressed,
    this.label,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: const Color(0xFF333333),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        onPressed: onPressed,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.w),
        child: Text(
          label!,
          style: TextStyle(
            fontFamily: 'BlissPro',
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ).tr(),
      ),
    );
  }
}

class CatalogItemButton extends StatelessWidget {
  const CatalogItemButton({Key? key, this.onPressed, this.title})
      : super(key: key);

  final String? title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12.w),
            Text(
              title!,
              style: TextStyle(
                fontFamily: 'BlissPro',
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ).tr(),
            SizedBox(height: 4.w),
            Padding(
              padding: EdgeInsets.only(left: 4.w),
              child: Divider(
                thickness: 1.w,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemButton extends StatelessWidget {
  const ItemButton({
    Key? key,
    this.image,
    this.title,
    this.onPressed,
  }) : super(key: key);

  final String? image;
  final String? title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        children: [
          Image.asset(
            image!,
            width: 171.w,
          ),
          Positioned(
            bottom: 0,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: Color.fromARGB(38, 0, 0, 0),
              ),
              child: SizedBox(
                width: 147.w,
                height: 24.w,
                child: Text(
                  title!,
                  style: TextStyle(
                    fontFamily: 'BlissPro',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PromotionItem extends StatelessWidget {
  const PromotionItem({
    Key? key,
    this.title,
    this.date,
    this.body,
    this.onPressed,
  }) : super(key: key);

  final String? title;
  final String? date;
  final String? body;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    DateTime dateStart = DateFormat('yyyy-MM-dd').parse(date!);
    return GestureDetector(
      onTap: onPressed ?? () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 12.w),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 280.w,
                child: Text(
                  title!,
                  style: TextStyle(
                    fontFamily: 'BlissPro',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: 80.w,
                child: Text(
                  DateFormat('dd/MM/yyyy').format(dateStart).toString(),
                  style: TextStyle(
                    fontFamily: 'BlissPro',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 4.w),
          SizedBox(
            width: 250.w,
            child: Text(
              body!,
              style: TextStyle(
                fontFamily: 'BlissPro',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xFFBDBDBD),
              ),
            ),
          ),
          SizedBox(height: 4.w),
          Padding(
            padding: EdgeInsets.only(left: 4.w),
            child: Divider(
              thickness: 1.w,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
