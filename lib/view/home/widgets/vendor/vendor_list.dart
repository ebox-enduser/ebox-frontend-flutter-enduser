import 'package:ebox/controller/controllers.dart';
import '../../../../core/theme/app_colors.dart';
import 'package:ebox/model/vendor.dart';
import 'package:ebox/view/cart/widgets/cart_meal_card.dart';
import 'package:ebox/view/home/widgets/vendor/vendor_card.dart';
import 'package:ebox/view/widgets/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VendorList extends StatelessWidget {
  const VendorList({super.key, required this.vendors});
  final List<Vendor> vendors;

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(color: Colors.amber),
      child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: vendors.length,
          itemBuilder: (context, index) => VendorCard(
                vendor: vendors[index],
              )),
    );
  }
}
