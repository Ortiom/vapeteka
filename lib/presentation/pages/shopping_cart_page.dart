import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vapeteka/constants/tr_consts.dart';
import 'package:vapeteka/controllers/api_controller.dart';
import 'package:vapeteka/models/products_models/order_model.dart';
import 'package:vapeteka/models/products_models/product_model.dart';
import 'package:vapeteka/presentation/pages/catalog_page.dart';
import 'package:vapeteka/presentation/pages/complete_oreder_screen.dart';
import 'package:vapeteka/presentation/widgets/buttons.dart';
import 'package:vapeteka/presentation/widgets/containers.dart';
import 'package:vapeteka/presentation/widgets/nav_bar.dart';
import 'package:vapeteka/services/response_result.dart';
import 'package:vapeteka/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({Key? key}) : super(key: key);

  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  ApiController apiController = Get.find();
  List<Products>? products = <Products>[].obs();
  int totalPrice = 0.obs();
  List<int> initialPriceList = <int>[];

  @override
  void initState() {
    products = apiController.productsInCart!;
    initialPriceList =
        List.generate(products!.length, (i) => products![i].price!);
    getInitialPrice();
    getTotalPrice();
    super.initState();
  }

  void getInitialPrice() {
    for (var i = 0; i < products!.length; i++) {
      initialPriceList[i] = products![i].initialPrice!;
      if (products![i].initialPrice! * products![i].amount! !=
          products![i].price) {
        products![i].price = initialPriceList[i] * products![i].amount!;
      }
    }
  }

  void getTotalPrice() {
    int price = 0;
    for (var i = 0; i < products!.length; i++) {
      price = price + (initialPriceList[i] * products![i].amount!);
    }
    totalPrice = price;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApiController>(
      builder: (_) => products!.isNotEmpty
          ? CustomScaffold(
              title: 'basket',
              actions: [
                IconButton(
                  onPressed: () {
                    products!.clear();
                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.restore_from_trash_outlined,
                    color: Colors.white,
                  ),
                )
              ],
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 16.w),
                  child: ListView.builder(
                    itemCount: products!.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, int index) {
                      return ProductInCartCard(
                        price: products![index].price.toString(),
                        title: products![index].name,
                        amount: products![index].amount!,
                        minusButton: () {
                          if (products![index].amount! > 0) {
                            products![index].amount =
                                products![index].amount! - 1;
                            products![index].price = initialPriceList[index] *
                                products![index].amount!;
                            getTotalPrice();
                          }
                          setState(() {});
                        },
                        plusButton: () {
                          products![index].amount =
                              products![index].amount! + 1;
                          products![index].price = initialPriceList[index] *
                              products![index].amount!;
                          getTotalPrice();
                          setState(() {});
                        },
                        onTap: () {
                          print('aboba');
                        },
                        imageUrl: products![index].images,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 16.h, 0.w, 16.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        LocaleKeys.final_price ,
                        style: TextStyle(
                          fontFamily: 'BlissPro',
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ).tr(),
                      Text(
                        totalPrice.toString(),
                        style: TextStyle(
                          fontFamily: 'BlissPro',
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        LocaleKeys.tenge,
                        style: TextStyle(
                          fontFamily: 'BlissPro',
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ).tr(),
                    ],
                  ),
                ),
                GreenButton(
                  label: 'order',
                  onPressed: () {
                    postData();
                  },
                ),
                SizedBox(height: 20.h),
              ],
            )
          : Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                title: Text(
                  LocaleKeys.basket,
                  style: TextStyle(
                      fontFamily: 'BlissPro',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ).tr(),
                backgroundColor: const Color(0xFF333333),
              ),
              bottomNavigationBar: const CustomNavBar(),
              body: Container(
                width: 1.sw,
                height: 1.sh,
                margin: EdgeInsets.symmetric(horizontal: 14.w, vertical: 23.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(
                    width: 1.5.w,
                    color: const Color(0xFF505050),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      LocaleKeys.basket_empty,
                      style: TextStyle(
                        fontFamily: 'BlissPro',
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ).tr(),
                    SizedBox(height: 16.h),
                    GreenButton(
                      label: LocaleKeys.basket_comeback,
                      onPressed: () {
                        Get.to(() => const CatalogPage());
                      },
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Future postData() async {
    Order order = Order(products: <ProductsForOrder>[]);
    for (int i = 0; i < products!.length; i++) {
      order.products?.add(ProductsForOrder(
          productId: products![i].id, quantity: products![i].amount));
    }

    apiController.orderRequest(order).then((value) {
      print(order.products!.length);
      if (value.status == Status.success) {
        Get.to(() => const CompleteOrderScreen());
      } else {
        Get.snackbar(error, value.errorText.toString(),
            backgroundColor: Colors.redAccent,
            colorText: Colors.white,
            duration: 4.seconds);
      }
    });
  }
}
