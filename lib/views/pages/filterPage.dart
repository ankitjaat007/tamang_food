import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamang_food/res/components/botton/coman_button.dart';
import 'package:tamang_food/res/services/controller/consumer_provider.dart';
import 'package:tamang_food/res/helper/appservices.dart';
import 'package:tamang_food/res/helper/colors.dart';
import 'package:tamang_food/res/dummyData.dart';
import 'package:tamang_food/res/helper/textStyle.dart';
import 'package:tamang_food/views/widgets/oops_widget/custom_appBar.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final changevalue = Provider.of<Consumer_Data>(context);
    return Scaffold(
      appBar: CustomAppBar(text: 'Filter', context: context),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categories',
                  style: AppTextStyle.fs16Light,
                ),
                Text(
                  'Clear all',
                  style: AppTextStyle.fs12Light,
                )
              ],
            ),
            App_Service.add_Height(10),
            Wrap(
                // crossAxisAlignment: WrapCrossAlignment.start,
                // spacing: 20,
                children: List.generate(
                    DummyData().filterCategories.length,
                    (index) => GestureDetector(
                          onTap: () {
                            changevalue.setcategoriesNumber(index);
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: changevalue.categoriesNumber == index
                                  ? AppColor.light_orange
                                  : Color.fromARGB(255, 200, 198, 198),
                            ),
                            child: Text(DummyData().filterCategories[index]),
                          ),
                        ))),
            App_Service.add_Height(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Dietary',
                  style: AppTextStyle.fs16Light,
                ),
                Text(
                  'Clear all',
                  style: AppTextStyle.fs12Light,
                )
              ],
            ),
            App_Service.add_Height(10),
            Wrap(
                spacing: 30,
                children: List.generate(
                    DummyData().filterDietary.length,
                    (index) => GestureDetector(
                          onTap: () {
                            changevalue.setdiratryNumber(index);
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: changevalue.diratryNumber == index
                                  ? AppColor.light_orange
                                  : Color.fromARGB(255, 200, 198, 198),
                            ),
                            child: Text(DummyData().filterDietary[index]),
                          ),
                        ))),
            App_Service.add_Height(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'price range',
                  style: AppTextStyle.fs16Light,
                ),
                Text(
                  'Clear all',
                  style: AppTextStyle.fs12Light,
                )
              ],
            ),
            App_Service.add_Height(10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: List.generate(
                      DummyData().filterprice_range.length,
                      (index) => GestureDetector(
                            onTap: () {
                              changevalue.setprizeRange(index);
                            },
                            child: Chip(
                                backgroundColor: changevalue.prizeRange == index
                                    ? AppColor.light_orange
                                    : Color.fromARGB(255, 200, 198, 198),
                                padding: EdgeInsets.all(17),
                                shape: CircleBorder(),
                                label:
                                    Text(DummyData().filterprice_range[index])),
                          ))),
            ),
            Spacer(),
            Coman_IconButton(radius: 10, btnName: 'Apply filters')
          ],
        ),
      ),
    );
  }
}
