import 'package:ebox/view/settings/delivery_location/widgets/map_screen.dart';
import 'package:ebox/view/widgets/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocationDetailScreen extends StatelessWidget {
  const LocationDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailScreen(
          screen: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Get.to(() => MapScreen());
                  },
                  child: Text('pick location'))
            ],
          ),
          title: 'title'),
    );
  }
}
