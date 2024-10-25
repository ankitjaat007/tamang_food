import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:tamang_food/res/helper/colors.dart';
import 'package:tamang_food/res/dummyData.dart';
import 'package:tamang_food/res/helper/textStyle.dart';
import 'package:tamang_food/utils/routes/routes_name.dart';

import '../res/components/botton/coman_button.dart';
import '../res/helper/appConfig.dart';

class Boarding_page extends StatefulWidget {
  const Boarding_page({super.key});

  @override
  State<Boarding_page> createState() => _Boarding_pageState();
}

class _Boarding_pageState extends State<Boarding_page> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Gap(20),
              Row(
                children: [
                  Image.asset(
                    AppConfig.app_icone,
                  ),
                  Expanded(
                    child: Text(
                      AppConfig.app_name,
                      style: AppConfig.app_name_style,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
              Gap(20),
              CarouselSlider(
                  items: DummyData()
                      .boarding_Data
                      .map((e) => Image.asset(e['image']))
                      .toList(),
                  options: CarouselOptions(
                      onPageChanged: (i, r) {
                        setState(() {
                          activeIndex = i;
                        });
                      },
                      autoPlay: true,
                      aspectRatio: 1.sp,
                      enlargeCenterPage: false,
                      viewportFraction: 1)),
              Gap(20),
              Text(
                DummyData().boarding_Data[activeIndex]['title'],
                style: AppTextStyle.fs30Normal,
              ),
              Gap(20),
              Text(
                DummyData().boarding_Data[activeIndex]['subtitle'],
                style: TextStyle(color: AppColor.gray),
                textAlign: TextAlign.center,
              ),
              Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                      3,
                      (index) => Container(
                            margin: EdgeInsets.symmetric(horizontal: 3),
                            height: 10,
                            width: 15,
                            decoration: BoxDecoration(
                                color: index == activeIndex
                                    ? AppColor.green
                                    : AppColor.gray,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100))),
                          ))
                ],
              ),
              Gap(20),
              Coman_IconButton(
                onpressed: () {
                  // App_Service.push_to_screen(Sign_In_page(), context);
                  Navigator.pushNamed(context, RouteName.sign_In_page);
                },
                radius: 10,
                btnName: 'Get Started',
              )
            ],
          ),
        ),
      ),
    );
  }
}
