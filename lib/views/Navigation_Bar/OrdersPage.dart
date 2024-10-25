import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamang_food/res/helper/appservices.dart';
import 'package:tamang_food/res/helper/colors.dart';
import 'package:tamang_food/res/helper/textStyle.dart';
import 'package:tamang_food/res/services/controller/all_controller.dart';
import 'package:tamang_food/views/widgets/foodTile.dart';
import 'package:tamang_food/views/widgets/oops_widget/custom_appBar.dart';

class Order_page extends StatelessWidget {
  const Order_page({super.key});

  @override
  Widget build(BuildContext context) {
    final FoodModel = Provider.of<AllController>(context).getallFood;
    return Scaffold(
      appBar: CustomAppBar(text: 'Your Orders', context: context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Upcoming orders',
                    style: AppTextStyle.fs16Light,
                  ),
                  Text('Clear all')
                ],
              ),
              App_Service.add_Height(10),
              ...List.generate(FoodModel.length,
                  (index) => FoodTile(foodmodel: FoodModel[index])),
              App_Service.add_Height(10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Proceed Payment',
                    style: AppTextStyle.fs16Semi_Bold
                        .copyWith(color: AppColor.light_orange),
                  ),
                ],
              ),
              App_Service.add_Height(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Past orders',
                    style: AppTextStyle.fs16Light,
                  ),
                  Text('Clear all')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
