import 'package:flutter/material.dart';
import 'package:tamang_food/res/services/models/all_models.dart';
import 'package:tamang_food/res/helper/appservices.dart';
import 'package:tamang_food/res/helper/colors.dart';

// ignore: must_be_immutable
class Search_restaurant extends StatelessWidget {
  ResturentModel restmodel;
  Search_restaurant({super.key, required this.restmodel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          restmodel.rest_image.first,
        ),
        App_Service.add_Height(5),
        Text(restmodel.rest_name),
        Text(
          '\$\$ ● ${restmodel.rest_tastService.join(" ● ")}',
          style: TextStyle(color: AppColor.gray),
        )
      ],
    );
  }
}
