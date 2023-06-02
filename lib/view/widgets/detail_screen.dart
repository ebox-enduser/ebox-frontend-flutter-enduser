import 'package:ebox/view/settings/about_ebox_screen.dart';
import 'package:ebox/view/settings/contact_us_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/theme/app_colors.dart';

class DetailScreen extends StatelessWidget {
  final Widget screen;
  final String title;
  const DetailScreen({super.key, required this.screen, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background_login.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: REdgeInsets.only(top: 30, left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: CircleAvatar(
                      radius: 20.r,
                      backgroundColor: Colors.black.withOpacity(0.4),
                      foregroundColor: Colors.white,
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 20.r,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 240.w,
                    child: Text(title,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.bold)),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => ContactUsScreen());
                    },
                    child: CircleAvatar(
                      radius: 20.r,
                      backgroundColor: AppColors.thirdlyColor,
                      foregroundColor: Colors.white,
                      child: Icon(
                        Icons.help_outline,
                        size: 20.r,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                    top: 0,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 1,
                      height: MediaQuery.of(context).size.height * 1,
                    )),
                Positioned(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 0.88,
                    decoration: BoxDecoration(
                        color: AppColors.secondaryBackgroundColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.r),
                            topRight: Radius.circular(15.r))),
                    child: SingleChildScrollView(
                      child: SafeArea(
                        child: screen,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
