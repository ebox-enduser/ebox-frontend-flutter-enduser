import 'package:ebox/view/plan/widgets/plan_card.dart';
import 'package:ebox/view/plan/widgets/plan_loading/plan_loading_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';

import '../../../model/plan.dart';

class PlanList extends StatelessWidget {
  final List<Plan> plans;
  const PlanList({
    super.key,
    required this.plans,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StaggeredGrid.count(
          crossAxisCount: 5,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: [
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 2,
              child: PlanCard(
                plan: plans[0],
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 3,
              mainAxisCellCount: 2,
              child: PlanCard(
                plan: plans[1],
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 5,
              mainAxisCellCount: 2,
              child: PlanCard(
                plan: plans[2],
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 3,
              mainAxisCellCount: 2,
              child: PlanCard(
                plan: plans[3],
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 3,
              mainAxisCellCount: 2,
              child: PlanCard(
                plan: plans[4],
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 4,
              child: PlanCard(
                plan: plans[5],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
