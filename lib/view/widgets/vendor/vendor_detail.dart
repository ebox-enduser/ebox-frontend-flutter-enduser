import 'package:ebox/view/home/widgets/meal_list_vendor.dart';
import 'package:ebox/view/widgets/meal_loading/meal_loading_list.dart';
import 'package:ebox/view/widgets/vendor/vendor_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../../../controller/controllers.dart';
import '../../../core/theme/app_colors.dart';
import '../../../model/vendor.dart';

class VendorDetail extends StatelessWidget {
  const VendorDetail({super.key, required this.vendor});
  final Vendor vendor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                  child: SizedBox(
                width: Get.width,
                height: Get.height,
              )),
              Positioned(
                top: 0,
                child: Container(
                  width: Get.width,
                  height: 300.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(vendor.imageVendorBackground),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: REdgeInsets.only(left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () => Get.back(),
                                child: CircleAvatar(
                                  radius: 20.r,
                                  backgroundColor:
                                      Colors.black.withOpacity(0.4),
                                  foregroundColor: Colors.white,
                                  child: Icon(
                                    Icons.arrow_back_ios_new,
                                    size: 20.r,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(
                                      () => VendorInfoScreen(
                                            vendor: vendor,
                                          ),
                                      transition:
                                          Transition.rightToLeftWithFade);
                                },
                                child: CircleAvatar(
                                  radius: 20.r,
                                  backgroundColor: AppColors.thirdlyColor,
                                  foregroundColor: Colors.white,
                                  child: Icon(
                                    Icons.person,
                                    size: 20.r,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.75,
                  decoration: BoxDecoration(
                      color: AppColors.secondaryBackgroundColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.r),
                          topRight: Radius.circular(15.r))),
                  child: Padding(
                    padding:
                        REdgeInsets.only(left: 15.r, right: 15.r, top: 15.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: REdgeInsets.only(left: 120, bottom: 30.r),
                          child: Text(
                            vendor.nameVendor,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.sp),
                          ),
                        ),
                        Padding(
                          padding: REdgeInsets.only(left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.timelapse,
                                    color: AppColors.secondaryColor,
                                    size: 20.r,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    '${vendor.duration} ',
                                    style: TextStyle(
                                        color: AppColors.textColor,
                                        fontSize: 10.sp),
                                  ),
                                  Text(
                                    'mins'.tr,
                                    style: TextStyle(
                                        color: AppColors.textColor,
                                        fontSize: 10.sp),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.pin_drop,
                                    color: AppColors.thirdlyColor,
                                    size: 20.r,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    '${vendor.distance} ',
                                    style: TextStyle(
                                        color: AppColors.textColor,
                                        fontSize: 10.sp),
                                  ),
                                  Text(
                                    'km'.tr,
                                    style: TextStyle(
                                        color: AppColors.textColor,
                                        fontSize: 10.sp),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.delivery_dining,
                                    color: AppColors.primaryColor,
                                    size: 20.r,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    '\$${vendor.delivery}',
                                    style: TextStyle(
                                        color: AppColors.textColor,
                                        fontSize: 10.sp),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.receipt,
                                    color: AppColors.iconColor,
                                    size: 20.r,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    vendor.ordered,
                                    style: TextStyle(
                                        color: AppColors.textColor,
                                        fontSize: 10.sp),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const Divider(),
                        Obx(() {
                          if (dashboardController.isVendorLoading.value) {
                            return const MealLoadingList();
                          } else {
                            if (dashboardController.vendorList.isNotEmpty) {
                              return MealListVendor(vendor: vendor);
                            } else {
                              return Center(
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/meal_not_found.png',
                                      scale: 7,
                                    ),
                                    Padding(
                                      padding: REdgeInsets.all(15),
                                      child: Text(
                                        'Meals not found!'.tr,
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
              Positioned(
                  top: 115.h,
                  left: 30.w,
                  child: CircleAvatar(
                    radius: 50.r,
                    foregroundImage: NetworkImage(vendor.imageVendor),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
