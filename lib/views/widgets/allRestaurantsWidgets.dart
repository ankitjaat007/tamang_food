import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tamang_food/res/services/controller/consumer_provider.dart';
import 'package:tamang_food/res/services/models/all_models.dart';
import 'package:tamang_food/views/widgets/singlewidgetModel/singleRestaurant.dart';

import '../../res/helper/appservices.dart';
import '../../res/helper/colors.dart';
import '../../res/helper/images&icons.dart';
import '../../res/helper/textStyle.dart';

// ignore: must_be_immutable
class AllRest_widget extends StatefulWidget {
  ResturentModel restModel;
  AllRest_widget({super.key, required this.restModel});

  @override
  State<AllRest_widget> createState() => _AllRest_widgetState();
}

class _AllRest_widgetState extends State<AllRest_widget> {
  // int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        App_Service.push_to_screen(
            SingleRestaurant(restmodel: widget.restModel), context);
      },
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Consumer<Consumer_Data>(builder: (context, value, child) {
            return Stack(alignment: Alignment.bottomRight, children: [
              CarouselSlider(
                  items: widget.restModel.rest_image
                      .map((e) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                e.toString(),
                                fit: BoxFit.cover,
                                width: App_Service.getscreenwidth(context),
                              ),
                            ),
                          ))
                      .toList(),
                  options: CarouselOptions(
                      onPageChanged: (i, r) {
                        value.setindexallrext(i);
                        // setState(() {
                        //   activeIndex = i;
                        // });
                      },
                      autoPlay: true,
                      aspectRatio: 1.9.sp,
                      enlargeCenterPage: false,
                      viewportFraction: 1)),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                    widget.restModel.rest_image.length,
                    (index) => Container(
                          margin: EdgeInsets.only(bottom: 20, right: 15),
                          decoration: BoxDecoration(
                              color: value.indexallRest == index
                                  ? AppColor.white
                                  : AppColor.gray,
                              borderRadius: BorderRadius.circular(10)),
                          height: 10.h,
                          width: 15.w,
                        )),
              )
            ]);
          }),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.restModel.rest_name,
                  style: AppTextStyle.fs20Light,
                ),
                App_Service.add_Height(5),
                widget.restModel.rest_tastService == []
                    ? SizedBox()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            Image.asset(
                              AppIcons.dolersign,
                              scale: 3.7,
                            ),
                            ...List.generate(
                                widget.restModel.rest_tastService.length,
                                (index) => Text(
                                      "● ${widget.restModel.rest_tastService[index]}",
                                      style: TextStyle(color: AppColor.gray),
                                    )),
                            SizedBox()
                          ]),
                App_Service.add_Height(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    widget.restModel.rest_rating == 0
                        ? SizedBox()
                        : Row(
                            children: [
                              Text(widget.restModel.rest_rating.toString()),
                              Image.asset(
                                AppIcons.star,
                                scale: 3.7,
                              ),
                              Text('200+ Ratings'),
                            ],
                          ),
                    widget.restModel.delevery_time == ''
                        ? SizedBox()
                        : Row(
                            children: [
                              Image.asset(
                                AppIcons.clock,
                                scale: 1,
                              ),
                              Text(widget.restModel.delevery_time),
                            ],
                          ),
                    widget.restModel.free_delivery == true
                        ? Row(
                            children: [
                              Image.asset(
                                AppIcons.dolerDelivery,
                                scale: 1,
                              ),
                              Text('Free'),
                            ],
                          )
                        : SizedBox(),
                    SizedBox()
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
