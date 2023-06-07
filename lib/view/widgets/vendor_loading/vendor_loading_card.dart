import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class VendorLoadingCard extends StatelessWidget {
  const VendorLoadingCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Colors.white,
      baseColor: Colors.grey.shade300,
      child: Padding(
        padding: REdgeInsets.all(15),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                child: SizedBox(
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
                )),
            Positioned(
                top: 0,
                left: 160,
                child: CircleAvatar(
                  radius: 40.r,
                ))
          ],
        ),
      ),
    );
  }
}
