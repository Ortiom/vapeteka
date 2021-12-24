import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vapeteka/controllers/api_controller.dart';
import 'package:vapeteka/models/promotion_model.dart';
import 'package:vapeteka/presentation/pages/promotion_detail_page.dart';
import 'package:vapeteka/presentation/widgets/buttons.dart';
import 'package:vapeteka/presentation/widgets/nav_bar.dart';

class PromotionPage extends StatefulWidget {
  const PromotionPage({Key? key}) : super(key: key);

  @override
  _PromotionPageState createState() => _PromotionPageState();
}

class _PromotionPageState extends State<PromotionPage> {
  ApiController apiController = Get.find();
  PromotionsModel promotionsModel = PromotionsModel().obs();

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    await apiController.promotionsReq();
    promotionsModel = apiController.promotionsModel;
    apiController.update();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApiController>(
      builder: (_) => CustomScaffold(
        showLeading: false,
        title: 'Акции',
        children: [
          apiController.loading && promotionsModel.notifications == null
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
              : promotionsModel.notifications != null
                  ? Padding(
                      padding: EdgeInsets.only(left: 16.w),
                      child: ListView.builder(
                        itemCount: promotionsModel.notifications!.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, int index) {
                          return PromotionItem(
                            title: promotionsModel.notifications![index].title,
                            date:
                                promotionsModel.notifications![index].createdAt,
                            body: promotionsModel.notifications![index].content,
                            onPressed: () {
                              Get.to(
                                () => const PromotionDetailScreen(),
                                arguments:
                                    promotionsModel.notifications![index],
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
