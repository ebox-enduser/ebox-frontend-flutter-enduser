import 'package:ebox/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1.r),
            spreadRadius: 1.r,
            blurRadius: 10.r,
            offset: Offset(0.r, 2.r),
          ),
        ],
      ),
      width: MediaQuery.of(context).size.height * 0.5,
      height: MediaQuery.of(context).size.width * 0.18,
      child: Row(
        children: [
          SizedBox(
            width: 15.w,
          ),
          Icon(
            Icons.mail,
            size: 24.sp,
            color: AppColors.thirdlyColor,
          ),
          SizedBox(
            width: 15.w,
          ),
          Text(
            'Notification',
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
    ;
  }
}
