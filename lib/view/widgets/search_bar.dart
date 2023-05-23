import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
      child: Material(
        borderRadius: BorderRadius.circular(15),
        shadowColor: Colors.black.withOpacity(0.2),
        child: TextField(
          cursorColor: AppColors.primaryColor,
          decoration: InputDecoration(
            prefixIconColor: AppColors.primaryColor,
            prefixIcon: Icon(
              Icons.search,
              color: AppColors.primaryColor,
              size: 20.r,
            ),
            filled: true,
            fillColor: AppColors.secondaryBackgroundColor,
            hintText: 'Somlar kako, cha kdav,...'.tr,
            hintStyle: TextStyle(
                fontSize: 14.sp,
                color: AppColors.textColor,
                fontWeight: FontWeight.w300),
            contentPadding: REdgeInsets.only(top: 30),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: AppColors.secondaryBackgroundColor),
                borderRadius: BorderRadius.circular(30.r)),
            enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: AppColors.secondaryBackgroundColor),
                borderRadius: BorderRadius.circular(30.r)),
          ),
        ),
      ),
    );
  }
}
