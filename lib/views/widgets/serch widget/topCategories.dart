import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamang_food/res/services/models/all_models.dart';
import 'package:tamang_food/res/helper/appservices.dart';
import 'package:tamang_food/res/helper/colors.dart';
import 'package:tamang_food/res/helper/textStyle.dart';

// ignore: must_be_immutable
class Top_Categories extends StatelessWidget {
  CategoryModel catmodel;
  Top_Categories({super.key, required this.catmodel});

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          catmodel.cat_img,
          fit: BoxFit.cover,
          height: 170.h,
          width: App_Service.getscreenwidth(context),
        ),
      ),
      Container(
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.4),
            borderRadius: BorderRadius.circular(15)),
      ),
      Text(
        catmodel.category_name,
        style: AppTextStyle.fs16Light.copyWith(color: AppColor.white),
      )
    ]);
  }
}
