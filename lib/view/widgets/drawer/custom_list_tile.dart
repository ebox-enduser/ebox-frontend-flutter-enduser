import 'package:ebox/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomListTile extends StatelessWidget {
  final bool isCollapsed;
  final IconData icon;
  final String title;
  final IconData? doHaveMoreOptions;
  final int infoCount;
  final Widget widget;

  const CustomListTile({
    Key? key,
    required this.isCollapsed,
    required this.icon,
    required this.title,
    this.doHaveMoreOptions,
    required this.infoCount,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => widget);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        width: isCollapsed ? 300.w : 80.w,
        height: 40.h,
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Icon(
                      icon,
                      color: Colors.black54,
                      size: 20.r,
                    ),
                    if (infoCount > 0)
                      Positioned(
                        right: -5.w,
                        top: -5.h,
                        child: Container(
                          height: 10.h,
                          width: 10.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            color: Colors.red,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            if (isCollapsed) SizedBox(width: 10.w),
            if (isCollapsed)
              Expanded(
                flex: 4,
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Text(
                        title,
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (infoCount > 0)
                      Expanded(
                        flex: 2,
                        child: Container(
                          margin: REdgeInsets.only(left: 10),
                          width: 20.w,
                          height: 20.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: AppColors.thirdlyColor,
                          ),
                          child: Center(
                            child: Text(
                              infoCount.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.sp),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            if (isCollapsed) const Spacer(),
            if (isCollapsed)
              Expanded(
                flex: 1,
                child: doHaveMoreOptions != null
                    ? IconButton(
                        icon: Icon(
                          doHaveMoreOptions,
                          color: Colors.black,
                          size: 12.r,
                        ),
                        onPressed: () {},
                      )
                    : const Center(),
              ),
          ],
        ),
      ),
    );
  }
}
