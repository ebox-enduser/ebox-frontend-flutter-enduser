import '../../../core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DoneOrdering extends StatelessWidget {
  const DoneOrdering({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //row
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 80).r,
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: const Icon(Icons.arrow_back_ios),
                    ),
                    Text("Ordering Process",
                        style: TextStyle(
                            fontSize: 24.sp, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.calendar_month,
                      color: AppColors.primaryColor,
                    ),
                    SizedBox(
                      width: 5.h,
                    ),
                    const Icon(
                      Icons.more_horiz,
                      color: AppColors.primaryColor,
                    ),
                    SizedBox(
                      width: 5.h,
                    ),
                    const Icon(
                      Icons.store,
                      color: AppColors.primaryColor,
                    ),
                    SizedBox(
                      width: 5.h,
                    ),
                    const Icon(
                      Icons.more_horiz,
                      color: AppColors.primaryColor,
                    ),
                    SizedBox(
                      width: 5.h,
                    ),
                    const Icon(
                      Icons.square,
                      color: AppColors.primaryColor,
                    ),
                    SizedBox(
                      width: 5.h,
                    ),
                    const Icon(
                      Icons.more_horiz,
                      color: AppColors.primaryColor,
                    ),
                    SizedBox(
                      width: 5.h,
                    ),
                    const Icon(
                      Icons.delivery_dining,
                      color: AppColors.primaryColor,
                    ),
                    SizedBox(
                      width: 5.h,
                    ),
                    const Icon(
                      Icons.more_horiz,
                      color: AppColors.primaryColor,
                    ),
                    SizedBox(
                      width: 5.h,
                    ),
                    const Icon(
                      Icons.check_box_sharp,
                      color: AppColors.primaryColor,
                    )
                  ],
                )
              ],
            ),
          ),
          //content
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/done.png",
                    height: 300.h,
                    width: 300.w,
                  ),
                  Text(
                    "Done!",
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 150.h,
          ),
        ],
      ),
    );
  }
}
