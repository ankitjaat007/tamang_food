import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamang_food/res/services/models/all_models.dart';
import 'package:tamang_food/views/widgets/singlewidgetModel/singleFood.dart';

import '../../res/helper/appservices.dart';
import '../../res/helper/colors.dart';
import '../../res/helper/textStyle.dart';

// ignore: must_be_immutable
class FoodTile extends StatelessWidget {
  FoodModel foodmodel;
  FoodTile({super.key, required this.foodmodel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        App_Service.push_to_screen(SingleFood(foodmodel: foodmodel), context);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                foodmodel.food_img,
                fit: BoxFit.cover,
                height: 115.sp,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        foodmodel.food_name,
                        style: AppTextStyle.fs18Light,
                      ),
                      App_Service.add_Height(10),
                      Text(
                        foodmodel.description,
                        style: AppTextStyle.fs16Normal
                            .copyWith(color: AppColor.gray),
                      ),
                      App_Service.add_Height(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$\$  ●  ${foodmodel.food_tast}',
                            style: TextStyle(color: AppColor.gray),
                          ),
                          Text(
                            'AUD\$${foodmodel.price}',
                            style: AppTextStyle.fs16Normal
                                .copyWith(color: AppColor.light_orange),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Divider(
            color: AppColor.gray,
          )
        ],
      ),
    );
  }
}
