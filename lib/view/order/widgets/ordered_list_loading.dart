import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'ordered_card_loading.dart';

class OrderedListLoading extends StatelessWidget {
  const OrderedListLoading({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        padding: REdgeInsets.only(top: 15),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) {
          return const OrderedCardLoading();
        });
  }
}
