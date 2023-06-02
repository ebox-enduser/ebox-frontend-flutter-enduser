import 'package:ebox/view/settings/profile/widgets/information_card.dart';
import 'package:ebox/view/widgets/detail_screen.dart';
import 'package:flutter/material.dart';

import '../../../../model/vendor.dart';

class VendorInfoScreen extends StatelessWidget {
  final Vendor vendor;

  const VendorInfoScreen({super.key, required this.vendor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailScreen(
          screen: Column(
            children: [
              InformationCard(title: 'Name', Data: vendor.vendorName),
              InformationCard(
                  title: 'Business Time', Data: vendor.businessTime),
              InformationCard(
                  title: 'Location', Data: vendor.locations.toString()),
              InformationCard(title: 'Distance', Data: '${vendor.distance}km'),
              InformationCard(title: 'Phone Number', Data: vendor.phoneNumber),
              InformationCard(title: 'Delivery', Data: '\$${vendor.delivery}'),
              InformationCard(title: 'Ordered', Data: vendor.ordered),
            ],
          ),
          title: vendor.vendorName),
    );
  }
}
