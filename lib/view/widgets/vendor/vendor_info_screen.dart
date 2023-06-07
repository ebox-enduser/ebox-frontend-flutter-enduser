import 'package:ebox/view/drawer/profile/widgets/information_card.dart';
import 'package:ebox/view/widgets/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/vendor.dart';

class VendorInfoScreen extends StatelessWidget {
  final Vendor vendor;

  const VendorInfoScreen({super.key, required this.vendor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailScreen(
          screen: Column(
            children: [
              InformationCard(title: 'Name'.tr, Data: vendor.nameVendor),
              InformationCard(
                  title: 'Business Time'.tr, Data: vendor.businessTime),
              InformationCard(
                  title: 'Location'.tr, Data: vendor.location.toString()),
              InformationCard(
                  title: 'Distance'.tr, Data: '${vendor.distance}km'),
              InformationCard(
                  title: 'Phone Number'.tr, Data: vendor.phoneNumber),
              InformationCard(
                  title: 'Delivery'.tr, Data: '\$${vendor.delivery}'),
              InformationCard(title: 'Ordered'.tr, Data: vendor.ordered),
            ],
          ),
          title: vendor.nameVendor),
    );
  }
}
