import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tamang_food/res/services/controller/consumer_provider.dart';
import 'package:tamang_food/res/services/functions/filter_function.dart';
import 'package:tamang_food/res/services/models/all_models.dart';
import 'package:tamang_food/res/helper/images&icons.dart';
import 'package:tamang_food/res/helper/textStyle.dart';
import 'package:tamang_food/views/widgets/foodTile.dart';

import '../../../res/services/controller/all_controller.dart';
import '../../../res/helper/appservices.dart';
import '../../../res/helper/colors.dart';

// ignore: must_be_immutable
class SingleRestaurant extends StatefulWidget {
  ResturentModel restmodel;
  // FoodModel foodmodel;
  SingleRestaurant({super.key, required this.restmodel});

  @override
  State<SingleRestaurant> createState() => _SingleRestaurantState();
}

class _SingleRestaurantState extends State<SingleRestaurant> {
  getSelectedCategory() {
    final aa = Provider.of<AllController>(context, listen: false);
    return aa.getallCategroy.isNotEmpty ? aa.getallCategroy.first : null;
  }

  late CategoryModel? selectedCategory = getSelectedCategory();

  @override
  Widget build(BuildContext context) {
    final aa = Provider.of<AllController>(context);
    final bb = Provider.of<AllFilterFunction>(context);
    final catData = aa.getallCategroy;
    final Featured_Items = bb.featured_items(context);

    final filterFood = aa.getallFood
        .where((e) => e.rest_id == widget.restmodel.rest_id)
        .toList();

    // print(filterFood.length);

    final food = selectedCategory == null
        ? filterFood
        : filterFood
            .where((element) => element.cat_id == selectedCategory!.cat_id)
            .toList();

    // print(food.length);

    final mostPopular =
        food.where((element) => element.food_rating == 4.5).toList();
    // =============

    // print(foodData.length);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              App_Service.pop_screen(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
        actions: [
          Image.asset(
            AppIcons.share,
            scale: 3.5,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              Icons.search,
              size: 30,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer<Consumer_Data>(builder: (context, value, child) {
              return Stack(alignment: Alignment.bottomRight, children: [
                CarouselSlider(
                    items: widget.restmodel.rest_image
                        .map((e) => Image.asset(
                              e.toString(),
                              fit: BoxFit.cover,
                              width: App_Service.getscreenwidth(context),
                            ))
                        .toList(),
                    options: CarouselOptions(
                        onPageChanged: (i, r) {
                          value.setindexNumber(i);
                          // setState(() {
                          //   activeIndex = i;
                          // });
                        },
                        autoPlay: true,
                        aspectRatio: 1.2.sp,
                        enlargeCenterPage: false,
                        viewportFraction: 1)),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                      widget.restmodel.rest_image.length,
                      (index) => Container(
                            margin: EdgeInsets.only(bottom: 20, right: 15),
                            decoration: BoxDecoration(
                                color: value.indexNumber == index
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
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.restmodel.rest_name,
                    style: AppTextStyle.fs24Semi_Bold,
                  ),
                  App_Service.add_Height(5),
                  widget.restmodel.rest_tastService == []
                      ? SizedBox()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                              Image.asset(
                                AppIcons.dolersign,
                                scale: 3.7,
                              ),
                              ...List.generate(
                                  widget.restmodel.rest_tastService.length,
                                  (index) => Text(
                                        "● ${widget.restmodel.rest_tastService[index]}",
                                        style: TextStyle(color: AppColor.gray),
                                      )),
                              SizedBox()
                            ]),
                  App_Service.add_Height(10),
                  widget.restmodel.rest_rating == 0
                      ? SizedBox()
                      : Row(
                          children: [
                            Text(widget.restmodel.rest_rating.toString()),
                            Image.asset(
                              AppIcons.star,
                              scale: 3.7,
                            ),
                            Text('200+ Ratings'),
                          ],
                        ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      widget.restmodel.free_delivery == false
                          ? SizedBox()
                          : Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  AppIcons.dolerDelivery1,
                                  color: AppColor.light_orange,
                                  scale: 2.5,
                                ),
                                Text('free\nDelivery')
                              ],
                            ),
                      widget.restmodel.delevery_time == ''
                          ? SizedBox()
                          : Row(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  AppIcons.clock1,
                                  color: AppColor.light_orange,
                                  scale: 2.6,
                                ),
                                Text(widget.restmodel.delevery_time)
                              ],
                            ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Take away',
                          style: TextStyle(color: AppColor.light_orange),
                        ),
                        style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    side: BorderSide(
                                        color: AppColor.light_orange)))),
                      )
                    ],
                  ),
                  App_Service.add_Height(5),
                  Text(
                    'Featured Items',
                    style: AppTextStyle.fs20Light,
                  ),
                  App_Service.add_Height(5),
                  AspectRatio(
                    aspectRatio: 1.8,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: Featured_Items.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.only(right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  Featured_Items[index].food_img,
                                  fit: BoxFit.cover,
                                  height: 150.sp,
                                  width: 140.sp,
                                  // width: App_Service.getscreenwidth(context),
                                ),
                              ),
                              Text(Featured_Items[index].food_name),
                              Featured_Items[index].food_tast == ''
                                  ? SizedBox()
                                  : Row(
                                      children: [
                                        Image.asset(
                                          AppIcons.dolersign,
                                          scale: 3.5,
                                        ),
                                        Text(
                                          ' ● ${Featured_Items[index].food_tast}',
                                          style:
                                              TextStyle(color: AppColor.gray),
                                        )
                                      ],
                                    )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          catData.length,
                          (index) => TextButton(
                              onPressed: () {
                                setState(() {
                                  selectedCategory = catData[index];
                                });
                              },
                              child: Text(
                                catData[index].category_name,
                                style: AppTextStyle.fs24Semi_Bold.copyWith(
                                    color: selectedCategory != null &&
                                            selectedCategory!.cat_id ==
                                                catData[index].cat_id
                                        ? AppColor.black
                                        : AppColor.gray),
                              ))),
                    ),
                  ),
                  mostPopular.isEmpty
                      ? SizedBox()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              Text(
                                'Most Populars',
                                style: AppTextStyle.fs20Light,
                              ),
                              App_Service.add_Height(10),
                              ListView.builder(
                                padding: EdgeInsets.zero,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: mostPopular.length,
                                itemBuilder: (context, index) {
                                  return FoodTile(
                                      foodmodel: mostPopular[index]);
                                },
                              ),
                            ]),
                  food.isEmpty
                      ? SizedBox()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              Text(
                                selectedCategory!.category_name.toString(),
                                style: AppTextStyle.fs20Light,
                              ),
                              App_Service.add_Height(10),
                              ListView.builder(
                                padding: EdgeInsets.zero,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: food.length,
                                itemBuilder: (context, index) {
                                  return FoodTile(foodmodel: food[index]);
                                },
                              ),
                            ])
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
