import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theme/app_colors.dart';

class InformationCard extends StatelessWidget {
  final String title;
  // ignore: non_constant_identifier_names
  final String Data;
  // ignore: non_constant_identifier_names
  const InformationCard({super.key, required this.title, required this.Data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(bottom: 15.r, right: 15.r, left: 15.r),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.w),
        ),
        width: MediaQuery.of(context).size.width * 1,
        child: Padding(
          padding: REdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
              Padding(
                padding: REdgeInsets.all(10.0),
                child: Text(
                  Data,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color: AppColors.secondaryColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
