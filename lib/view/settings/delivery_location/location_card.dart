import 'package:ebox/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(top: 15, right: 15, left: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1.r),
              spreadRadius: 3.r,
              blurRadius: 5.r,
              offset: Offset(0.r, 1.r),
            ),
          ],
        ),
        width: MediaQuery.of(context).size.height * 0.5,
        child: Padding(
          padding: REdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.home,
                    color: AppColors.thirdlyColor,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    "Home".tr,
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
                  ),
                  Spacer(),
                  CircleAvatar(
                    foregroundColor: Colors.white,
                    backgroundColor: AppColors.secondaryColor,
                    radius: 14.r,
                    child: Icon(
                      Icons.edit,
                      size: 16.r,
                    ),
                  )
                ],
              ),
              SizedBox(height: 15.h),
              Text(
                'Example',
                style: TextStyle(color: AppColors.textColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
