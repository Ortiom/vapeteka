import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vapeteka/presentation/widgets/buttons.dart';

class PromotionPage extends StatefulWidget {
  const PromotionPage({Key? key}) : super(key: key);

  @override
  _PromotionPageState createState() => _PromotionPageState();
}

class _PromotionPageState extends State<PromotionPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w),
      child: Column(
        children: const [
          PromotionItem(
            title: 'Акция',
            date: '22/09/2021',
            body:
                'Обслужите Ваш девайс абсолютно бесплатно, во всей сети «Vapeteka»!',
          ),
          PromotionItem(
            title: 'Акция',
            date: '22/09/2021',
            body: 'Уточнить цены, спросить любой вопрос 24/7',
          ),
          PromotionItem(
            title: 'Акция',
            date: '22/09/2021',
            body: 'Поздравляем с 76 годовщиной победы!',
          ),
        ],
      ),
    );
  }
}
