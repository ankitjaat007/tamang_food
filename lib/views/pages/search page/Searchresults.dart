import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tamang_food/res/services/controller/all_controller.dart';
import 'package:tamang_food/res/services/models/all_models.dart';
import 'package:tamang_food/views/widgets/oops_widget/custom_appBar.dart';
import 'package:tamang_food/views/widgets/seeAllTile.dart';

// ignore: must_be_immutable
class Searchresults extends StatelessWidget {
  FoodModel foodModel;
  Searchresults({super.key, required this.foodModel});

  @override
  Widget build(BuildContext context) {
    final a = Provider.of<AllController>(context).getallResturent;
    final rest = a
        .where(
          (element) => element.food_id == foodModel.food_id,
        )
        .toList();

    return Scaffold(
      appBar: CustomAppBar(text: 'text', context: context),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: rest.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              // mainAxisSpacing: 12,
              mainAxisExtent: 500.sp),
          itemBuilder: (context, index) {
            return SeeAllTile(restmodel: rest[index]);
          },
        ),
      ),
    );
  }
}
