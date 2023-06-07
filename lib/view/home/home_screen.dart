// ignore: implementation_imports
import 'dart:async';

import 'package:ebox/view/home/widgets/carousel_slider/carousel_loading.dart';
import 'package:ebox/view/home/widgets/carousel_slider/carousel_slider_view.dart';
import 'package:ebox/view/home/widgets/vendor_list.dart';

import 'package:ebox/view/widgets/vendor_loading/vendor_loading_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../controller/controllers.dart';
import '../../core/theme/app_colors.dart';
import '../widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchVendorsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => Padding(
                    padding: REdgeInsets.only(left: 15, right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Text('Hello'.tr,
                            style: TextStyle(
                                color: AppColors.iconColor,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold)),
                        Text(authController.user.value?.fullName ?? 'Not Yet',
                            style: TextStyle(
                                fontSize: 20.sp, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  )),

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
              SearchBar(
                hintText: 'Search vendors'.tr,
                textEditingController: searchVendorsController,
              ),
              Obx(() {
                // dashboardController.getVendorByName(
                //     keyword: searchVendorsController.text.toLowerCase());
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
