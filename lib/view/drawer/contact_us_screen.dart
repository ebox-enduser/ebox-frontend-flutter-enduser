
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/theme/app_colors.dart';
import '../widgets/detail_screen.dart';
import '../widgets/logo_text.dart';
import 'about_ebox_screen.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailScreen(
          screen: Padding(
            padding: REdgeInsets.all(15),
            child: Column(
              children: [
                LogoText(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      'https://firebasestorage.googleapis.com/v0/b/ebox-42cef.appspot.com/o/Telegram_logo.svg.webp?alt=media&token=a4f36faa-995b-4c0c-9701-aa02575e4fa2&_gl=1*1qzc1wp*_ga*MTQ2ODY5MTg1NC4xNjg1NTIzOTQx*_ga_CW55HF8NVT*MTY4NTUyMzk0MC4xLjEuMTY4NTUyNTEyMy4wLjAuMA..',
                      scale: 40.r,
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Text(
                      "+855123123123",
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      'https://firebasestorage.googleapis.com/v0/b/ebox-42cef.appspot.com/o/Facebook-logo.png?alt=media&token=87ad94de-81a7-4ad8-aec0-bd690c43efb6&_gl=1*12j57qh*_ga*MTQ2ODY5MTg1NC4xNjg1NTIzOTQx*_ga_CW55HF8NVT*MTY4NTUyMzk0MC4xLjEuMTY4NTUyNTM3My4wLjAuMA..',
                      scale: 10.r,
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Text(
                      "Best In Box",
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      'https://firebasestorage.googleapis.com/v0/b/ebox-42cef.appspot.com/o/800px-LinkedIn_logo_initials.png?alt=media&token=24e40b0c-4f64-45ad-aef9-e11673b8b665&_gl=1*14yjd5l*_ga*MTQ2ODY5MTg1NC4xNjg1NTIzOTQx*_ga_CW55HF8NVT*MTY4NTUyMzk0MC4xLjEuMTY4NTUyNTQwNC4wLjAuMA..',
                      scale: 15.r,
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Text(
                      "bestinbox",
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          ),
          title: 'Contact Us'.tr),
    );
  }
}
