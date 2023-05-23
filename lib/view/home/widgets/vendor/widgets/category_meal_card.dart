import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';

class CategoryMealCard extends StatelessWidget {
  const CategoryMealCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(right: 15, bottom: 10),
      child: Container(
        width: 60.w,
        height: 90.h,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(0, 0.r), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(15.r))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Fried',
              style: TextStyle(
                  color: AppColors.textColor, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 15.h,
            ),
            CircleAvatar(
              backgroundColor: AppColors.thirdlyColor,
              foregroundColor: Colors.white,
              child: Icon(Icons.soup_kitchen),
            )
          ],
        ),
      ),
    );
  }
}
