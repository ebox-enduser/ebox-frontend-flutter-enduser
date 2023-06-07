import 'package:ebox/model/vendor.dart';
import 'package:ebox/view/widgets/vendor/vendor_card.dart';
import 'package:flutter/material.dart';

class VendorList extends StatelessWidget {
  const VendorList({super.key, required this.vendors});
  final List<Vendor> vendors;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: vendors.length,
        itemBuilder: (context, index) => VendorCard(
              vendor: vendors[index],
            ));
  }
}
