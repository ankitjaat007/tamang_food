import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamang_food/res/services/models/all_models.dart';

import '../../../res/helper/appservices.dart';
import '../../../res/helper/colors.dart';

// ignore: must_be_immutable
class categoriesFood extends StatelessWidget {
  FoodModel foodModel;
  categoriesFood({super.key, required this.foodModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              foodModel.food_img,
              fit: BoxFit.cover,
              height: 140.h,
              width: App_Service.getscreenwidth(context),
            ),
            App_Service.add_Height(5),
            Text(foodModel.food_name),
            Text(
              '${foodModel.description}',
              style: TextStyle(color: AppColor.gray),
            )
          ],
        )
      ],
    );
  }
}
