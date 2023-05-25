import 'package:ebox/core/constants/const.dart';
import 'package:ebox/view/home/widgets/vendor/vendor_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controller/controllers.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../model/cart_meal.dart';
import '../../../../model/vendor.dart';

class VendorCard extends StatelessWidget {
  final Vendor vendor;
  const VendorCard({super.key, required this.vendor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => VendorDetail(
              vendor: vendor,
            ));
      },
      child: Padding(
        padding: REdgeInsets.all(15),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                child: Container(
              width: Get.width,
              height: 200.h,
              // decoration: BoxDecoration(color: Colors.red),
            )),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  width: Get.width,
                  height: 160.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15.r)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3.r), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: REdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 140.w,
                              child: Text(
                                vendor.name,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                SizedBox(
                                  width: 100.h,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.timelapse,
                                            color: AppColors.secondaryColor,
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Text(
                                            '${vendor.duration} ',
                                            style: TextStyle(
                                                color: AppColors.textColor,
                                                fontSize: 12.sp),
                                          ),
                                          Text(
                                            'mins'.tr,
                                            style: TextStyle(
                                                color: AppColors.textColor,
                                                fontSize: 12.sp),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.pin_drop,
                                            color: AppColors.thirdlyColor,
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Text(
                                            '${vendor.distance} ',
                                            style: TextStyle(
                                                color: AppColors.textColor,
                                                fontSize: 12.sp),
                                          ),
                                          SizedBox(
                                            width: 45.w,
                                            child: Text(
                                              'km'.tr,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: AppColors.textColor,
                                                  fontSize: 12.sp),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 80.h,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            '\$${vendor.delivery.toString()}',
                                            style: TextStyle(
                                                color: AppColors.textColor,
                                                fontSize: 12.sp),
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          const Icon(
                                            Icons.delivery_dining,
                                            color: AppColors.primaryColor,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          SizedBox(
                                            width: 45.w,
                                            child: Text(
                                              '${vendor.ordered}',
                                              textAlign: TextAlign.end,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: AppColors.textColor,
                                                  fontSize: 12.sp),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          const Icon(
                                            Icons.receipt,
                                            color: AppColors.iconColor,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                        width: 140.w,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.r)),
                            image: DecorationImage(
                                image:
                                    NetworkImage(vendor.vendorImageBackground),
                                fit: BoxFit.cover)),
                      )
                    ],
                  ),
                )),
            Positioned(
                top: 0,
                left: 160,
                child: CircleAvatar(
                  radius: 40.r,
                  foregroundImage: NetworkImage(
                    vendor.vendorImage,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
