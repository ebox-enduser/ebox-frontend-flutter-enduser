import 'package:ebox/view/plan/meal/meal_list_plan.dart';
import 'package:ebox/view/widgets/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/controllers.dart';
import '../../../model/plan.dart';
import '../../home/widgets/meal_list_vendor.dart';
import '../../widgets/meal_loading/meal_loading_list.dart';

class PlanDetailScreen extends StatelessWidget {
  final Plan plan;
  const PlanDetailScreen({super.key, required this.plan});

  @override
  Widget build(BuildContext context) {
    return DetailScreen(
        screen: Column(
          children: [MealListPlan(plan: plan)],
        ),
        title: plan.name);
  }
}
