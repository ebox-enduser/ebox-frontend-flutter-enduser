import 'package:ebox/view/order/widgets/ordered_list.dart';
import 'package:ebox/view/order/widgets/ordered_list_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../../../controller/controllers.dart';
import '../../../core/theme/app_colors.dart';

class OrderedScreen extends StatefulWidget {
  const OrderedScreen({super.key});

  @override
  State<OrderedScreen> createState() => _OrderedScreenState();
}

class _OrderedScreenState extends State<OrderedScreen> {
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
      body: LiquidPullToRefresh(
        color: AppColors.primaryColor,
        backgroundColor: AppColors.secondaryColor,
        key: _refreshIndicatorKey, // key if you want to add
        onRefresh: () async {
          dashboardController.getMealOrdered();
        },
        showChildOpacityTransition: false,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: REdgeInsets.all(15),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/receipt.png',
                        scale: 20,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "Ordered History".tr,
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Obx(() {
                  if (dashboardController.isMealOrderedLoading.value) {
                    return const OrderedListLoading();
                  } else {
                    if (dashboardController.mealOrderedList.isNotEmpty) {
                      return OrderedList(
                        mealOrderedList: dashboardController.mealOrderedList,
                        scrollController: _scrollController,
                      );
                    } else {
                      return Center(
                        child: Column(
                          children: [
                            Image.network(
                              'https://firebasestorage.googleapis.com/v0/b/ebox-42cef.appspot.com/o/no_order_found.png?alt=media&token=a2a5d11d-fee7-4166-8e13-b9f85579db0e&_gl=1*7pg5dw*_ga*MTQ2ODY5MTg1NC4xNjg1NTIzOTQx*_ga_CW55HF8NVT*MTY4NjIwMDY4OC40LjEuMTY4NjIwMTIxOC4wLjAuMA..',
                              scale: 5,
                            ),
                            Padding(
                              padding: REdgeInsets.all(15),
                              child: Text(
                                'No orders found!'.tr,
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
