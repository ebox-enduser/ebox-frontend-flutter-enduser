import 'package:ebox/core/theme/app_colors.dart';
import 'package:ebox/model/notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationCard extends StatelessWidget {
  final Notifications notifications;
  const NotificationCard({super.key, required this.notifications});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(bottom: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.r),
        ),
        width: MediaQuery.of(context).size.width * 0.5,
        child: Padding(
          padding: REdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.mail,
                    size: 24.sp,
                    color: AppColors.thirdlyColor,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    notifications.title,
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  Text(
                    timeago.format(notifications.createdAt),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 10.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 1.00,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.w,
              ),
              Text(
                notifications.description,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 12.sp,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 1.00,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
