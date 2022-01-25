import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vapeteka/constants/url.dart';
import 'package:vapeteka/controllers/api_controller.dart';
import 'package:vapeteka/models/products_models/product_model.dart';
import 'package:vapeteka/presentation/pages/shopping_cart_page.dart';
import 'package:vapeteka/presentation/widgets/buttons.dart';
import 'package:vapeteka/presentation/widgets/nav_bar.dart';
import 'package:vapeteka/translations/locale_keys.g.dart';

class SingleProductScreen extends StatefulWidget {
  const SingleProductScreen({Key? key}) : super(key: key);

  @override
  _SingleProductScreenState createState() => _SingleProductScreenState();
}

class _SingleProductScreenState extends State<SingleProductScreen> {
  ApiController apiController = Get.find();
  int amount = 1;
  late Products products;

  @override
  void initState() {
    products = Get.arguments;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApiController>(
      builder: (_) => CustomScaffold(
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => const ShoppingCartScreen());
            },
            icon: const Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
            ),
          )
        ],
        title: 'product',
        children: [
          SizedBox(
            height: 320.w,
            child: Image.network(
              baseUrl + '/storage/' + (products.images ?? ''),
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            (loadingProgress.expectedTotalBytes!)
                        : null,
                  ),
                );
              },
              errorBuilder: (context, exception, stackTrace) {
                return Icon(
                  Icons.image_outlined,
                  size: 80.w,
                  color: Colors.grey,
                );
              },
            ),
          ),
          Text(
            products.name!,
            style: TextStyle(
                fontFamily: 'BlissPro', fontSize: 24.sp, color: Colors.white),
          ),
          Divider(
            color: const Color(0xFF474747),
            thickness: 1.w,
          ),
          SizedBox(height: 14.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(LocaleKeys.price, style: TextStyle(
                          fontFamily: 'BlissPro',
                          fontSize: 24.sp,
                          color: Colors.white)).tr(),
                      Text(' ${products.price} ',style: TextStyle(
                          fontFamily: 'BlissPro',
                          fontSize: 24.sp,
                          color: Colors.white)),
                      Text(LocaleKeys.tenge,style: TextStyle(
                          fontFamily: 'BlissPro',
                          fontSize: 24.sp,
                          color: Colors.white)).tr(),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        LocaleKeys.amount,
                        style: TextStyle(
                            fontFamily: 'BlissPro',
                            fontSize: 24.sp,
                            color: Colors.white),
                      ).tr(),
                      Text(' $amount ',style: TextStyle(
                          fontFamily: 'BlissPro',
                          fontSize: 24.sp,
                          color: Colors.white)),
                      Text(
                        LocaleKeys.items,
                        style: TextStyle(
                            fontFamily: 'BlissPro',
                            fontSize: 24.sp,
                            color: Colors.white),
                      ).tr(),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 21.h),
          Text(
            'select_quantity',
            style: TextStyle(
                fontFamily: 'BlissPro', fontSize: 14.sp, color: Colors.white),
          ).tr(),
          SizedBox(
            width: 205.w,
            child: Padding(
              padding: EdgeInsets.only(top: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      amount++;
                      setState(() {});
                    },
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.w),
                        child: Icon(
                          Icons.add,
                          color: Colors.black,
                          size: 25.w,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    amount.toString(),
                    style: TextStyle(
                      fontFamily: 'BlissPro',
                      fontSize: 48.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (amount > 0) {
                        amount--;
                      }
                      setState(() {});
                    },
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.w),
                        child: Icon(
                          Icons.remove,
                          color: Colors.black,
                          size: 25.w,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 40.h),
          GreenButton(
            label: 'add',
            onPressed: () {},
          ),
          SizedBox(height: 26.h),
        ],
      ),
    );
  }
}
