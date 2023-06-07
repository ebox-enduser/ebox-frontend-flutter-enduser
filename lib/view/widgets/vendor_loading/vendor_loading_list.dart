import 'package:ebox/view/widgets/vendor_loading/vendor_loading_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VendorLoadingList extends StatelessWidget {
  const VendorLoadingList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        padding: REdgeInsets.only(top: 15),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) => const VendorLoadingCard());
  }
}
