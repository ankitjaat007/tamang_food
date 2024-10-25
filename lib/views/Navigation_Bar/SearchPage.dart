import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tamang_food/res/services/controller/all_controller.dart';
import 'package:tamang_food/res/helper/textStyle.dart';
import 'package:tamang_food/utils/routes/routes_name.dart';
import 'package:tamang_food/views/widgets/serch%20widget/topResturant.dart';

import '../../res/helper/appservices.dart';
import '../../res/helper/colors.dart';

class Search_page extends StatelessWidget {
  const Search_page({super.key});

  @override
  Widget build(BuildContext context) {
    final restmodel = Provider.of<AllController>(context).getallResturent;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Search',
                style: AppTextStyle.fs28Semi_Bold,
              ),
              App_Service.add_Height(10),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Search on foodly',
                    contentPadding: EdgeInsets.all(0),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.gray)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.gray)),
                    fillColor: Color.fromARGB(255, 231, 228, 228),
                    filled: true,
                    prefixIcon: Icon(Icons.search)),
              ),
              App_Service.add_Height(10),
              Text(
                'Top Restaurants',
                style: AppTextStyle.fs16Normal,
              ),
              App_Service.add_Height(10),
              GridView.builder(
                shrinkWrap: true,
                itemCount: restmodel.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisExtent: 200.sp),
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        // App_Service.push_to_screen(Search_food(), context);
                        Navigator.pushNamed(context, RouteName.search_food);
                      },
                      child: Search_restaurant(restmodel: restmodel[index]));
                },
              )
            ]),
          ),
        ),
      ),
    );
  }
}
