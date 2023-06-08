import 'package:ebox/model/vendor.dart';
import 'package:ebox/view/widgets/vendor/vendor_card.dart';
import 'package:flutter/material.dart';

class VendorList extends StatelessWidget {
  const VendorList(
      {super.key, required this.vendors, required this.scrollController});
  final List<Vendor> vendors;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: scrollController,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: vendors.length,
        itemBuilder: (context, index) => VendorCard(
              vendor: vendors[index],
            ));
  }
}
