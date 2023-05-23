import 'package:ebox/view/widgets/detail_screen.dart';

import '../../../core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class FindingIngredients extends StatelessWidget {
  const FindingIngredients({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: DetailScreen(
          screen: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: REdgeInsets.only(left: 60, right: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(
                      Icons.store,
                      color: AppColors.primaryColor,
                    ),
                    Icon(Icons.more_horiz),
                    Icon(Icons.add_box),
                    Icon(
                      Icons.more_horiz,
                    ),
                    Icon(Icons.delivery_dining),
                    Icon(
                      Icons.more_horiz,
                    ),
                    Icon(Icons.check_box_sharp)
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/search.png",
                        height: 300.h,
                        width: 300.w,
                      ),
                      Text(
                        "Vendor finding your ingredients",
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
          title: 'Ordering'),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: AppColors.primaryColor,
        ),
        width: MediaQuery.of(context).size.height * 1,
        height: MediaQuery.of(context).size.width * 0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: REdgeInsets.only(left: 15, right: 15),
              child: Row(
                children: [
                  Text(
                    "Total: \$10",
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Spacer(),
                  Text(
                    "ETC: 40 mins",
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            Padding(
              padding: REdgeInsets.only(top: 15, left: 15, right: 15),
              child: Text(
                "Samlar Kako x3, Nom Banh Jok x1",
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(fontSize: 12.sp, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
