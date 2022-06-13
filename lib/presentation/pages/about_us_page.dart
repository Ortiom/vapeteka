import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vapeteka/presentation/widgets/icon_link.dart';

import '../widgets/nav_bar.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

final Uri _urlFb = Uri.parse('https://www.facebook.com/vapeteka/');
final Uri _urlVk = Uri.parse('https://vk.com/vapetekaofficial');
final Uri _urlInsta = Uri.parse('https://www.instagram.com/vapeteka/');
final Uri _urlTwitter = Uri.parse('https://twitter.com/vapeteka_com');
final Uri _urlTelegram = Uri.parse('https://t.me/vapeteka');
final Uri _urlYouTube =
    Uri.parse('https://www.youtube.com/watch?v=LwimKACG7jg');

Future<void> _launchUrl(Uri url) async {
  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) throw 'Could not launch $url';
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'about_us',
          style: TextStyle(
              fontFamily: 'BlissPro',
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white),
        ).tr(),
        backgroundColor: const Color(0xFF333333),
      ),
      bottomNavigationBar: const CustomNavBar(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16),
            child: Text(
              'VAPETEKA VAPESHOP&BAR',
              style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LinkIconWidget(
                  onTap: () => _launchUrl(_urlInsta),
                  svgIcon: 'assets/svg_icons/instagram.svg',
                ),
                LinkIconWidget(
                  onTap: () => _launchUrl(_urlTelegram),
                  svgIcon: 'assets/svg_icons/telegram.svg',
                ),
                LinkIconWidget(
                  onTap: () => _launchUrl(_urlFb),
                  svgIcon: 'assets/svg_icons/facebook.svg',
                ),
                LinkIconWidget(
                  onTap: () => _launchUrl(_urlVk),
                  svgIcon: 'assets/svg_icons/vk.svg',
                ),
                LinkIconWidget(
                  onTap: () => _launchUrl(_urlTwitter),
                  svgIcon: 'assets/svg_icons/twitter.svg',
                ),
                LinkIconWidget(
                  onTap: () => _launchUrl(_urlYouTube),
                  svgIcon: 'assets/svg_icons/youtube.svg',
                ),
              ],
            ),
          ),
          const ContactsInfoContainer(
            title: 'Vapeteka на Мендикулова',
            address: 'г.Алматы, мкрн.Самал-2, д.84',
            phoneNumber: '+7 (727) 250 00 04',
            phoneNumber2: '+7 (708) 250 00 04',
            email: 'almaty@vapeteka.kz',
          ),
          const ContactsInfoContainer(
            title: 'Vapeteka на Сатпаева',
            address: 'г.Алматы, ул.Сатпаева, д.64б',
            phoneNumber: ' +7 (727) 392 00 58',
            phoneNumber2: '+7 (708) 250 01 14',
            email: 'satpayeva@vapeteka.kz',
          ),
          const ContactsInfoContainer(
            title: 'Vapeteka Астана',
            address: 'г.Нур-султан, Мангилик Ел, д.28',
            phoneNumber: '+7 (708) 250 01 13',
            email: 'astana@vapeteka.kz',
          ),
        ],
      ),
    );
  }
}

class ContactsInfoContainer extends StatelessWidget {
  final String? title;
  final String? address;
  final String? phoneNumber;
  final String? phoneNumber2;
  final String? email;
  const ContactsInfoContainer(
      {Key? key,
      this.title,
      this.address,
      this.phoneNumber,
      this.phoneNumber2,
      this.email})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.white)),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SelectableText(
                  '$title',
                  style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 14.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 10.w),
                          child: const Icon(Icons.map, color: Colors.white),
                        ),
                        SelectableText(
                          '$address',
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 10.w),
                          child: const Icon(Icons.phone, color: Colors.white),
                        ),
                        SelectableText(
                          '$phoneNumber',
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    phoneNumber2 != null
                        ? Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 10.w),
                                child: const Icon(Icons.phone,
                                    color: Colors.white),
                              ),
                              SelectableText(
                                '$phoneNumber2',
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          )
                        : const SizedBox(),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 10.w),
                          child: const Icon(Icons.email, color: Colors.white),
                        ),
                        SelectableText(
                          '$email',
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
