import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tamang_food/res/services/models/all_models.dart';
import 'package:tamang_food/res/helper/appservices.dart';
import 'package:tamang_food/res/helper/colors.dart';
import 'package:tamang_food/res/helper/images&icons.dart';
import 'package:tamang_food/res/helper/textStyle.dart';
import 'package:tamang_food/utils/routes/routes_name.dart';

import '../../../res/services/controller/all_controller.dart';

class Enter_address_page extends StatefulWidget {
  const Enter_address_page({super.key});

  @override
  State<Enter_address_page> createState() => _Enter_address_pageState();
}

class _Enter_address_pageState extends State<Enter_address_page> {
  TextEditingController address_controller = TextEditingController();

  bool focusfild = false;
  @override
  Widget build(BuildContext context) {
    int addressControllerlength = address_controller.text.length;
    final aa = Provider.of<AllController>(context);
    final rest_data = aa.getallResturent;

    List<ResturentModel> searchData = [];

    if (address_controller.text.length == 0) {
      searchData.addAll(rest_data);
    } else {
      searchData.addAll(rest_data.where((element) => element.rest_address
          .trim()
          .toLowerCase()
          .contains(address_controller.text.toString().trim().toLowerCase())));
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.close)),
                App_Service.add_Height(10),
                Center(
                    child: Text(
                  'Find restaurants near you ',
                  style: AppTextStyle.fs24Semi_Bold,
                )),
                App_Service.add_Height(10),
                Center(
                  child: Text(
                    'Please enter your location or allow access to\nyour location to find restaurants near you.',
                    style:
                        AppTextStyle.fs16Normal.copyWith(color: AppColor.gray),
                    textAlign: TextAlign.center,
                  ),
                ),
                addressControllerlength == 0
                    ? Column(
                        children: [
                          App_Service.add_Height(20),
                          TextButton.icon(
                              style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(
                                          color: AppColor.light_orange)),
                                  minimumSize: Size(
                                      App_Service.getscreenwidth(context),
                                      45.h)),
                              onPressed: () {},
                              icon: Image.asset(AppIcons.location),
                              label: Text(
                                'Use current location',
                                style: TextStyle(color: AppColor.light_orange),
                              )),
                        ],
                      )
                    : SizedBox(),
                App_Service.add_Height(20),
                TextFormField(
                  onTap: () {
                    setState(() {
                      focusfild = !focusfild;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      address_controller = address_controller;
                    });
                  },
                  controller: address_controller,
                  cursorColor: AppColor.green,
                  decoration: InputDecoration(
                      suffixIcon: addressControllerlength == 0
                          ? null
                          : IconButton(
                              onPressed: () {
                                setState(() {
                                  address_controller.clear();
                                });
                              },
                              icon: Container(
                                  decoration: BoxDecoration(
                                      color: AppColor.gray,
                                      shape: BoxShape.circle),
                                  child: Icon(
                                    Icons.close,
                                    size: 20,
                                    color: AppColor.black,
                                  ))),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: AppColor.gray)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: AppColor.gray)),
                      fillColor: Color(0xffFBFBFB),
                      filled: true,
                      prefixIcon: Icon(
                        Icons.location_on,
                        color: AppColor.gray,
                      ),
                      hintText: 'Enter a new address'),
                ),
                focusfild == true
                    ? Column(
                        children: List.generate(
                            searchData.length,
                            (index) => ListTile(
                                  onTap: () {
                                    // App_Service.push_to_screen(
                                    //     Bottom_navigationBar(
                                    //         restModel: searchData[index]),
                                    //     context);
                                    Navigator.pushNamed(
                                        context, RouteName.bottom_navigationBar,
                                        arguments: searchData[index]);
                                  },
                                  leading: Image.asset(
                                    AppIcons.location,
                                    color: AppColor.gray,
                                  ),
                                  title: Text(searchData[index].rest_address),
                                  subtitle:
                                      Text(searchData[index].rest_location),
                                )))
                    : SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
