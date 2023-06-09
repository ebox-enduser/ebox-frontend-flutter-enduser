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
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import '../../controller/controllers.dart';
import '../../core/theme/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();

  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: LiquidPullToRefresh(
        color: AppColors.primaryColor,
        backgroundColor: AppColors.secondaryColor,
        key: _refreshIndicatorKey, // key if you want to add
        onRefresh: () async {
          dashboardController.getVendors();
        }, // refresh callback
        showChildOpacityTransition: false,
        child: SingleChildScrollView(
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
                            height: 10.w,
                          ),
                          Text('Hello'.tr,
                              style: TextStyle(
                                  color: AppColors.iconColor,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold)),
                          Text(authController.user.value?.fullName ?? 'Not Yet',
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold)),
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
                Padding(
                  padding: REdgeInsets.all(15),
                  child: Material(
                    borderRadius: BorderRadius.circular(15),
                    child: Obx(
                      () => TextField(
                        controller: dashboardController.searchVendorsController,
                        onSubmitted: (value) {
                          dashboardController.getVendorByName(keyword: value);
                        },
                        onChanged: (value) {
                          dashboardController.searchVal.value = value;
                        },
                        cursorColor: AppColors.primaryColor,
                        decoration: InputDecoration(
                          prefixIconColor: AppColors.iconColor,
                          prefixIcon: Icon(
                            Icons.search,
                            size: 20.r,
                          ),
                          suffixIconColor: AppColors.iconColor,
                          suffixIcon: dashboardController
                                  .searchVal.value.isNotEmpty
                              ? IconButton(
                                  onPressed: () {
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());

                                    dashboardController.searchVendorsController
                                        .clear();
                                    dashboardController.searchVal.value = '';
                                    dashboardController.getVendors();
                                  },
                                  icon: Icon(
                                    Icons.clear,
                                    size: 20.r,
                                  ))
                              : null,
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Search vendors'.tr,
                          hintStyle: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w300),
                          contentPadding: REdgeInsets.only(top: 30),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(30.r)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(30.r)),
                        ),
                      ),
                    ),
                  ),
                ),
                Obx(() {
                  if (dashboardController.isVendorLoading.value) {
                    return const VendorLoadingList();
                  } else {
                    if (dashboardController.vendorList.isNotEmpty) {
                      return VendorList(
                        vendors: dashboardController.vendorList,
                        scrollController: _scrollController,
                      );
                    } else {
                      return Center(
                        child: Column(
                          children: [
                            Image.network(
                              'https://firebasestorage.googleapis.com/v0/b/ebox-42cef.appspot.com/o/no_vendor_found.png?alt=media&token=08f8c51e-a085-4dc7-b4d6-cc42f5996154&_gl=1*rnn9f6*_ga*MTQ2ODY5MTg1NC4xNjg1NTIzOTQx*_ga_CW55HF8NVT*MTY4NjIwMDY4OC40LjEuMTY4NjIwMDk2OS4wLjAuMA..',
                              scale: 7,
                            ),
                            Padding(
                              padding: REdgeInsets.all(15),
                              child: Text(
                                'No vendors found!'.tr,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    color: AppColors.textColor),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
