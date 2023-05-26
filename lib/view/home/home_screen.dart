// ignore: implementation_imports
import 'package:ebox/core/constants/const.dart';
import 'package:ebox/view/home/widgets/carousel_slider/carousel_loading.dart';
import 'package:ebox/view/home/widgets/carousel_slider/carousel_slider_view.dart';
import 'package:ebox/view/home/widgets/vendor/vendor_card.dart';
import 'package:ebox/view/home/widgets/vendor/vendor_detail.dart';
import 'package:ebox/view/home/widgets/vendor/vendor_list.dart';
import 'package:ebox/view/widgets/drawer/custom_drawer.dart';

import 'package:ebox/view/home/widgets/notification/notification_screen.dart';
import 'package:ebox/view/widgets/vendor_loading/vendor_loading_card.dart';
import 'package:ebox/view/widgets/vendor_loading/vendor_loading_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import '../../controller/controllers.dart';
import '../../core/theme/app_colors.dart';
import '../order/ordering/delivery_received.dart';
import '../widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => Padding(
                    padding: REdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(authController.user.value?.fullName ?? 'Not Yet',
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.bold)),
                        Text(
                            settingController.userLocation.value?.address ??
                                'Address',
                            style: TextStyle(
                                color: AppColors.textColor, fontSize: 10.sp)),
                      ],
                    ),
                  )),
              Padding(
                padding: REdgeInsets.only(left: 15),
                child: Text(
                  "Trending".tr,
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
              ),
              // carousel
              Obx(() {
                if (dashboardController.bannerList.isNotEmpty) {
                  return CarouselSliderView(
                      bannerList: dashboardController.bannerList);
                } else {
                  return const CarouselLoading();
                }
              }),

              // search
              const SearchBar(),
              Padding(
                padding: REdgeInsets.only(left: 15),
                child: Text(
                  "Vendor".tr,
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
              ),
              Obx(() {
                if (dashboardController.vendorList.isNotEmpty) {
                  return VendorList(vendors: dashboardController.vendorList);
                } else {
                  return const VendorLoadingList();
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
