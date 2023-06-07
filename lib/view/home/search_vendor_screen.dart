import 'package:ebox/view/widgets/detail_screen.dart';
import 'package:flutter/material.dart';

class SearchVendorScreen extends StatelessWidget {
  const SearchVendorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailScreen(
          screen: Column(
            children: const [],
          ),
          title: 'Search vendors'),
    );
  }
}
