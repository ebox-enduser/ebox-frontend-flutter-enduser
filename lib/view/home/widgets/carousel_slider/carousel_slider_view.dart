import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../model/ad_banner.dart';
import 'banner_card.dart';

class CarouselSliderView extends StatefulWidget {
  final List<AdBanner> bannerList;
  const CarouselSliderView({Key? key, required this.bannerList})
      : super(key: key);

  @override
  State<CarouselSliderView> createState() => _CarouselSliderViewState();
}

class _CarouselSliderViewState extends State<CarouselSliderView> {
  int _currentIndex = 0;
  late List<Widget> _bannerList;

  @override
  void initState() {
    _bannerList =
        widget.bannerList.map((e) => BannerCard(imageUrl: e.image)).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          CarouselSlider(
              items: _bannerList,
              options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  })),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.bannerList.map((e) {
              int index = widget.bannerList.indexOf(e);
              return Container(
                width: 6.w,
                height: 6.h,
                margin: EdgeInsets.symmetric(vertical: 10.w, horizontal: 2.h),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index
                        ? AppColors.primaryColor
                        : Colors.black.withOpacity(0.4)),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
