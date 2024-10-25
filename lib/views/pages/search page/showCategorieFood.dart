import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tamang_food/res/services/controller/all_controller.dart';
import 'package:tamang_food/res/services/models/all_models.dart';
import 'package:tamang_food/views/widgets/oops_widget/custom_appBar.dart';
import 'package:tamang_food/views/widgets/serch%20widget/categoriesFood.dart';

// ignore: must_be_immutable
class ShowCategoriesFood extends StatelessWidget {
  CategoryModel catmodel;
  // FoodModel foodModel;
  ShowCategoriesFood({super.key, required this.catmodel});

  @override
  Widget build(BuildContext context) {
    final a = Provider.of<AllController>(context).getallFood;
    final food = a
        .where(
          (element) => element.cat_id == catmodel.cat_id,
        )
        .toList();
    // print(food);
    return Scaffold(
      appBar: CustomAppBar(text: catmodel.category_name, context: context),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: food.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              // mainAxisSpacing: 12,
              mainAxisExtent: 230.sp),
          itemBuilder: (context, index) {
            return categoriesFood(foodModel: food[index]);
          },
        ),
      ),
    );
  }
}
