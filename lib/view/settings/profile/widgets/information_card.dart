import 'package:ebox/controller/controllers.dart';
import 'package:ebox/view/settings/profile/update_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';

class InformationCard extends StatelessWidget {
  final String title;
  final String Data;
  const InformationCard({super.key, required this.title, required this.Data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(bottom: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
        ),
        width: MediaQuery.of(context).size.height * 0.5,
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
