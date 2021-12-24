import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vapeteka/controllers/api_controller.dart';
import 'package:vapeteka/models/catalog_models/catalogs.dart';
import 'package:vapeteka/presentation/pages/products_page.dart';
import 'package:vapeteka/presentation/widgets/buttons.dart';
import 'package:vapeteka/presentation/widgets/nav_bar.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  _CatalogPageState createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  ApiController apiController = Get.find();
  CatalogsModel catalogsModel = CatalogsModel().obs();

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    await apiController.catalogReq();
    catalogsModel = apiController.catalogs!;
    apiController.update();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApiController>(
      builder: (_) => CustomScaffold(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
            ),
          )
        ],
        showLeading: false,
        title: 'Каталог',
        children: [
          apiController.loading && catalogsModel.catalogs == null
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
              : catalogsModel.catalogs != null
                  ? Padding(
                      padding: EdgeInsets.only(left: 16.w),
                      child: ListView.builder(
                        itemCount: catalogsModel.catalogs!.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, int index) {
                          return CatalogItemButton(
                            title: catalogsModel.catalogs![index].catalog,
                            onPressed: () {
                              Get.to(
                                () => const ProductsScreen(),
                                arguments: catalogsModel.catalogs![index].id,
                              );
                            },
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
