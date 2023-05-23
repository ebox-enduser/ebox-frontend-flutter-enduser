import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class NoOrderFound extends StatelessWidget {
  const NoOrderFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //row
            Padding(
              padding: REdgeInsets.only(top: 30, left: 20).r,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(Icons.arrow_back_ios),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Text("Ordering Process",
                      style: TextStyle(
                          fontSize: 24.sp, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            //content
            Column(
              children: [
                Image.asset(
                  "assets/images/no_order.png",
                  height: 300.h,
                  width: 300.w,
                ),
                Text(
                  "No Order Found Yet!",
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox()
          ],
        ),
      ),
    );
  }
}
