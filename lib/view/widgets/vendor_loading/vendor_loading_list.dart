import 'package:ebox/controller/controllers.dart';
import '../../../core/theme/app_colors.dart';
import 'package:ebox/model/vendor.dart';
import 'package:ebox/view/cart/widgets/cart_meal_card.dart';
import 'package:ebox/view/widgets/vendor/vendor_card.dart';
import 'package:ebox/view/widgets/detail_screen.dart';
import 'package:ebox/view/widgets/vendor_loading/vendor_loading_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VendorLoadingList extends StatelessWidget {
  const VendorLoadingList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(color: Colors.amber),
      child: ListView.builder(
          shrinkWrap: true,
          padding: REdgeInsets.only(top: 15),
          physics: NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) => VendorLoadingCard()),
    );
  }
}
