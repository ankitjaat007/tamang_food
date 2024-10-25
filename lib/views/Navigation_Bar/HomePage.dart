import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tamang_food/res/components/listTile/seeallListTile.dart';
import 'package:tamang_food/res/services/controller/all_controller.dart';
import 'package:tamang_food/res/services/controller/consumer_provider.dart';
import 'package:tamang_food/res/services/functions/filter_function.dart';
import 'package:tamang_food/res/services/models/all_models.dart';
import 'package:tamang_food/res/helper/appservices.dart';
import 'package:tamang_food/res/helper/colors.dart';
import 'package:tamang_food/res/helper/images&icons.dart';
import 'package:tamang_food/res/helper/textStyle.dart';
import 'package:tamang_food/utils/routes/routes_name.dart';
import 'package:tamang_food/views/widgets/allRestaurantsWidgets.dart';
import 'package:tamang_food/views/widgets/comanTile1.dart';

// ignore: must_be_immutable
class Home_page extends StatefulWidget {
  ResturentModel restBackModel;
  Home_page({super.key, required this.restBackModel});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  // int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    final aa = Provider.of<AllController>(context);
    final bb = Provider.of<AllFilterFunction>(context);
    final rest_data = aa.getallResturent;
    final banner = rest_data.where((e) => e.rest_banner.isNotEmpty).toList();
    // ===============
    final restTopRating = bb.searchRestRating(context, 4.5);
    // ===============
    // final featured_Partner = aa.searchResturent('Featured_Partners');

    // final featuredData=rest_data.where((element) => )
    // ========================================
    // ========================================
    // final food_data = aa.getallFood;

    // ========================================
    // ========================================
    // print(rest_data.length);
    // print(food_data.length);
    // print(restTopRating.length);
    // print("++==++");
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: AppColor.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Column(
          children: [
            // App_Service.add_Height(10),
            Text(
              'Delivery to',
              style:
                  AppTextStyle.fs12Light.copyWith(color: AppColor.light_orange),
            ),

            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.restBackModel.rest_address,
                  style: AppTextStyle.fs20Light.copyWith(color: AppColor.black),
                ),
                Icon(
                  Icons.keyboard_arrow_down_sharp,
                  color: AppColor.black,
                )
              ],
            )
          ],
        ),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {
                    // App_Service.push_to_screen(FilterPage(), context);
                    Navigator.pushNamed(context, RouteName.filterPage);
                  },
                  child:
                      Text('Filter', style: TextStyle(color: AppColor.black))),
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Consumer<Consumer_Data>(builder: (context, value, child) {
                // final banner = value.getallResturent
                //     .where((e) => e.rest_banner.isNotEmpty)
                //     .toList();/
                return Stack(alignment: Alignment.bottomRight, children: [
                  CarouselSlider(
                      items: banner
                          .map((e) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    e.rest_banner,
                                    fit: BoxFit.cover,
                                    width: App_Service.getscreenwidth(context),
                                  ),
                                ),
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
                          aspectRatio: 1.9.sp,
                          enlargeCenterPage: false,
                          viewportFraction: 1)),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                        banner.length,
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
              SeeallListTile(
                title: 'Featured\nPartners',
                onpress: () {
                  // App_Service.push_to_screen(FeaturedPartners(), context);
                  Navigator.pushNamed(context, RouteName.featuredPartners);
                },
              ),
              Consumer<AllFilterFunction>(builder: (context, value, child) {
                return AspectRatio(
                    aspectRatio: 1.25.sp,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: value.Featured_Partners(context).length >= 2
                            ? 2
                            : value.Featured_Partners(context).length,

                        //  rest_data
                        //     .where((element) => element.food_id != 0)
                        //     .toList()
                        //     .length,
                        itemBuilder: (context, index) {
                          // final restaurant = rest_data
                          //     .where((element) => element.food_id != 0)
                          //     .toList()[index];
                          // final foodData = food_data
                          //     .where((e) => rest_data
                          //         .any((element) => element.food_id == e.food_id))
                          //     .toList();
                          // final food = foodData.firstWhere(
                          //     (element) => element.food_id == restaurant.food_id);

                          return ComanTile(
                            restModel: value.Featured_Partners(context)[index],
                            // tilte: food.food_name,
                            // subtitle: restaurant.rest_address,
                            // image: food.food_img
                          );
                        }));
              }),
              App_Service.add_Height(10),
              Image.asset(
                AppImages.offer_banner,
                width: App_Service.getscreenwidth(context),
              ),
              App_Service.add_Height(10),
              SeeallListTile(
                  title: 'Best Picks\nRestaurants by\nteam',
                  onpress: () {
                    // App_Service.push_to_screen(BestPick(), context);
                    Navigator.pushNamed(context, RouteName.bestPick);
                  }),
              App_Service.add_Height(10),
              AspectRatio(
                aspectRatio: 1.25.sp,
                child: ListView.builder(
                  itemCount:
                      restTopRating.length >= 2 ? 2 : restTopRating.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ComanTile(restModel: restTopRating[index]);
                  },
                ),
              ),
              App_Service.add_Height(10),
              SeeallListTile(title: 'All Restaurants'),
              App_Service.add_Height(10),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: rest_data.length,
                itemBuilder: (context, index) {
                  return AllRest_widget(restModel: rest_data[index]);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
