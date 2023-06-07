import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';

class SearchBar extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;

  const SearchBar({
    Key? key,
    required this.hintText,
    required this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
      child: Material(
        borderRadius: BorderRadius.circular(15),
        child: TextField(
          controller: textEditingController,
          cursorColor: AppColors.primaryColor,
          decoration: InputDecoration(
            prefixIconColor: AppColors.primaryColor,
            prefixIcon: Icon(
              Icons.search,
              color: AppColors.iconColor,
              size: 20.r,
            ),
            filled: true,
            fillColor: Colors.white,
            hintText: hintText.tr,
            hintStyle: TextStyle(
                fontSize: 12.sp,
                color: AppColors.textColor,
                fontWeight: FontWeight.w300),
            contentPadding: REdgeInsets.only(top: 30),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(30.r)),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(30.r)),
          ),
        ),
      ),
    );
  }
}
