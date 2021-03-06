import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vapeteka/constants/tr_consts.dart';
import 'package:vapeteka/controllers/api_controller.dart';
import 'package:vapeteka/models/products_models/product_model.dart';
import 'package:vapeteka/presentation/pages/shopping_cart_page.dart';
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
        title: 'products',
        children: [
          apiController.loading
              ? SizedBox(
                  height: 0.8.sh,
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
              : products.products!.isEmpty
                  ? SizedBox(
                      height: 0.8.sh,
                      child: Center(
                        child: Flex(
                          mainAxisAlignment: MainAxisAlignment.center,
                          direction: Axis.vertical,
                          children: [
                            Icon(Icons.sticky_note_2_outlined, color: Colors.white, size: 50.w,),
                            Text(
                              'catalog_empty',
                              style: TextStyle(color: Colors.white, fontSize: 24.sp),
                            ).tr(),
                          ],
                        ),
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.only(top: 16.w),
                      child: ListView.builder(
                        itemCount: products.products!.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, int index) {
                          return ProductCard(
                            title: products.products![index].name,
                            amount: Text(
                              products.products![index].amount!.toString(),
                              style: TextStyle(
                                fontFamily: 'BlissPro',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                            addButton: () {
                              if (apiController.productsInCart!
                                  .where((element) =>
                                      element.id ==
                                      products.products![index].id)
                                  .isNotEmpty) {
                                Get.snackbar(oops, product_already,
                                    backgroundColor:
                                        Colors.transparent.withOpacity(0.80),
                                    colorText: Colors.white,
                                    duration: 4.seconds);
                              } else if (products.products![index].amount ==
                                  0) {
                                Get.snackbar(oops, product_amount,
                                    backgroundColor:
                                        Colors.transparent.withOpacity(0.80),
                                    colorText: Colors.white,
                                    duration: 4.seconds);
                              } else {
                                products.products![index].initialPrice =
                                    products.products![index].price;
                                apiController.productsInCart!
                                    .add(products.products![index]);
                                apiController.update();
                              }
                            },
                            minusButton: () {
                              if (products.products![index].amount! > 0) {
                                products.products![index].amount =
                                    products.products![index].amount! - 1;
                              }
                              setState(() {});
                            },
                            plusButton: () {
                              products.products![index].amount =
                                  products.products![index].amount! + 1;
                              apiController.update();
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
        ],
      ),
    );
  }
}
