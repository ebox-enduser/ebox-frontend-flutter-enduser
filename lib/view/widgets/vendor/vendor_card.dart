import 'package:ebox/view/widgets/vendor/vendor_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../../../model/vendor.dart';

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
        padding: REdgeInsets.only(left: 15, right: 15, top: 10),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                child: Container(
              width: Get.width,
              height: 170.h,
              // decoration: BoxDecoration(color: Colors.red),
            )),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 140.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15.r)),
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
                                vendor.nameVendor,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                SizedBox(
                                  width: 70.h,
                                  child: Column(
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
                                      SizedBox(
                                        height: 15.h,
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
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: AppColors.textColor,
                                                fontSize: 10.sp),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 70.h,
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
                                                fontSize: 10.sp),
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Icon(
                                            Icons.delivery_dining,
                                            color: AppColors.primaryColor,
                                            size: 20.r,
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
                                              vendor.ordered,
                                              textAlign: TextAlign.end,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: AppColors.textColor,
                                                  fontSize: 10.sp),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Icon(
                                            Icons.receipt,
                                            color: AppColors.iconColor,
                                            size: 20.r,
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
                      // ignore: prefer_const_constructors
                      Spacer(),
                      Container(
                        width: 140.w,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.r)),
                            image: DecorationImage(
                                image:
                                    NetworkImage(vendor.imageVendorBackground),
                                fit: BoxFit.cover)),
                      )
                    ],
                  ),
                )),
            Positioned(
                top: 0,
                left: 160.w,
                child: CircleAvatar(
                  radius: 40.r,
                  foregroundImage: NetworkImage(
                    vendor.imageVendor,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
