import 'package:ebox/model/vendor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../../widgets/meal/meal_card.dart';

class MealListVendor extends StatefulWidget {
  final Vendor vendor;
  const MealListVendor({Key? key, required this.vendor}) : super(key: key);

  @override
  State<MealListVendor> createState() => _MealListVendorState();
}

class _MealListVendorState extends State<MealListVendor> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();

  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: widget.vendor.nameMeal.length,
        itemBuilder: (context, index) => MealCard(
          fat: widget.vendor.fat[index],
          foodType: widget.vendor.foodType[index],
          mealImage: widget.vendor.imageMeal[index],
          price: widget.vendor.price[index],
          nameMeal: widget.vendor.nameMeal[index],
          ingredient: widget.vendor.ingredients[index],
          youtubeURL: widget.vendor.youtubeURL[index],
          vendor: widget.vendor,
          idMeal: widget.vendor.idMeal[index],
          idVendor: widget.vendor.idVendor,
          index: index,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 20.h),
      ),
    );
  }
}
