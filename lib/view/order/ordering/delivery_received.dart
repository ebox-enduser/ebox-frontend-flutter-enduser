import '../../../core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DeliveryReceived extends StatelessWidget {
  const DeliveryReceived({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //row
          Padding(
            padding: REdgeInsets.only(left: 30, right: 30, top: 45).r,
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
                    ),
                    SizedBox(
                      width: 5.h,
                    ),
                    const Icon(Icons.check_box_sharp)
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
                    "assets/images/delivery.png",
                    height: 200.h,
                    width: 300.w,
                  ),
                  Text(
                    "Our delivery recieved your meal",
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 80.h,
          ),

          Container(
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              boxShadow: [],
            ),
            width: MediaQuery.of(context).size.height * 0.9,
            height: MediaQuery.of(context).size.width * 0.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15).r,
                  child: Row(
                    children: [
                      Text(
                        "Total Price",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: 240.w,
                      ),
                      Text(
                        "10" "\$",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 35).r,
                  child: Row(
                    children: [
                      Text(
                        "Samlar Kako x3, Nom Banh Jok x1",
                        style: TextStyle(fontSize: 16.sp, color: Colors.white),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
