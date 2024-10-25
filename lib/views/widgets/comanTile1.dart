import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamang_food/res/services/models/all_models.dart';
import 'package:tamang_food/views/widgets/singlewidgetModel/singleRestaurant.dart';
// import 'package:provider/provider.dart';
// import 'package:tamang_food/services/models/all_models.dart';

// import '../../services/controller/all_controller.dart';
import '../../res/helper/appservices.dart';
import '../../res/helper/colors.dart';
import '../../res/helper/textStyle.dart';

// ignore: must_be_immutable
class ComanTile extends StatelessWidget {
  ResturentModel restModel;

  ComanTile({super.key, required this.restModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        App_Service.push_to_screen(
            SingleRestaurant(restmodel: restModel), context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Container(
          height: 230.h,
          width: 210.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Image.asset(
                  restModel.rest_image.first,
                  fit: BoxFit.cover,
                  width: App_Service.getscreenwidth(context),
                  height: 140.h,
                ),
                App_Service.add_Height(10),
                Text(
                  restModel.rest_name,
                  style: AppTextStyle.fs20Light,
                ),
                App_Service.add_Height(5),
                Text(
                  restModel.rest_address,
                  style: AppTextStyle.fs16Normal.copyWith(color: AppColor.gray),
                )
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: AppColor.light_orange,
                        borderRadius: BorderRadius.circular(10)),
                    height: 20.h,
                    width: 36.w,
                    child: Text(
                      restModel.rest_rating.toString(),
                      style: AppTextStyle.fs12Semi_Bold
                          .copyWith(color: AppColor.white),
                    ),
                  ),
                  Text(restModel.delevery_time),
                  Text(restModel.free_delivery == true ? 'Free delivery' : ""),
                  SizedBox()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
