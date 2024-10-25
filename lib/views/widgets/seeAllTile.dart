import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamang_food/res/services/models/all_models.dart';
import 'package:tamang_food/res/helper/appservices.dart';
import 'package:tamang_food/views/widgets/singlewidgetModel/singleRestaurant.dart';

import '../../res/helper/colors.dart';
import '../../res/helper/images&icons.dart';
import '../../res/helper/textStyle.dart';

// ignore: must_be_immutable
class SeeAllTile extends StatelessWidget {
  ResturentModel restmodel;
  SeeAllTile({super.key, required this.restmodel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        App_Service.push_to_screen(
            SingleRestaurant(restmodel: restmodel), context);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(alignment: Alignment.bottomLeft, children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                restmodel.rest_image.first,
                fit: BoxFit.cover,
                height: 280.sp,
                width: App_Service.getscreenwidth(context),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  restmodel.delevery_time == ''
                      ? SizedBox()
                      : Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              AppIcons.fast_delivery,
                              scale: 2,
                            ),
                            Text(
                              restmodel.delevery_time,
                              style: TextStyle(color: AppColor.white),
                            )
                          ],
                        ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      restmodel.free_delivery == true
                          ? Row(
                              children: [
                                Image.asset(
                                  AppIcons.dolerDelivery1,
                                  scale: 2.3,
                                ),
                                Text(
                                  'Free',
                                  style: TextStyle(color: AppColor.white),
                                ),
                              ],
                            )
                          : SizedBox(),
                      restmodel.rest_rating == 0
                          ? SizedBox()
                          : Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: AppColor.light_orange,
                                  borderRadius: BorderRadius.circular(10)),
                              height: 20.h,
                              width: 36.w,
                              child: Text(
                                restmodel.rest_rating.toString(),
                                style: AppTextStyle.fs12Semi_Bold
                                    .copyWith(color: AppColor.white),
                              ),
                            )
                    ],
                  )
                ],
              ),
            )
          ]),
          Text(
            'KFC Foods',
            style: AppTextStyle.fs20Light,
          ),
          App_Service.add_Height(10),
          restmodel.rest_tastService == []
              ? SizedBox()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      ...List.generate(
                          restmodel.rest_tastService.length >= 2
                              ? 2
                              : restmodel.rest_tastService.length,
                          (index) => Text(
                                "● ${restmodel.rest_tastService[index]}",
                                style: TextStyle(color: AppColor.gray),
                              )),
                      SizedBox()
                    ]),
        ],
      ),
    );
  }
}
