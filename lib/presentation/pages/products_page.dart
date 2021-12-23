import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vapeteka/controllers/api_controller.dart';
import 'package:vapeteka/models/products_models/product_model.dart';
import 'package:vapeteka/presentation/pages/single_product_page.dart';
import 'package:vapeteka/presentation/widgets/containers.dart';
import 'package:vapeteka/presentation/widgets/nav_bar.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  ApiController apiController = Get.find();
  ProductsModel products = ProductsModel().obs();

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    await apiController.productsReq(Get.arguments);
    products = apiController.products!;
    apiController.update();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApiController>(
      builder: (_) => CustomScaffold(
        title: 'Товары',
        children: [
          apiController.loading && products.products == null
              ? SizedBox(
                  height: 1.sh,
                  child: Center(
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
                  ),
                )
              : products.products != null
                  ? Padding(
                      padding: EdgeInsets.only(top: 16.w),
                      child: ListView.builder(
                        itemCount: products.products!.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, int index) {
                          return ProductCard(
                            title: products.products![index].name,
                            amount: products.products![index].amount,
                            addButton: () {},
                            minusButton: () {
                              products.products![index].amount! - 1;
                              print(json
                                  .decode(products.products![index].images!));
                              setState(() {});
                            },
                            plusButton: () {
                              products.products![index].amount! + 1;
                              setState(() {});
                            },
                            onTap: () {
                              Get.to(() => const SingleProductScreen(),
                                  arguments: products.products![index]);
                            },
                            imageUrl: products.products![index].images,
                          );
                        },
                      ),
                    )
                  : const SizedBox(),
        ],
      ),
    );
  }
}
