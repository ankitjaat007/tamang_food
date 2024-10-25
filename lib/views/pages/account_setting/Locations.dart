import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamang_food/res/services/controller/all_controller.dart';
import 'package:tamang_food/res/helper/appservices.dart';
import 'package:tamang_food/res/helper/textStyle.dart';
import 'package:tamang_food/views/widgets/oops_widget/custom_appBar.dart';

import '../../../res/helper/colors.dart';

class Locations_page extends StatelessWidget {
  const Locations_page({super.key});

  @override
  Widget build(BuildContext context) {
    final aa = Provider.of<AllController>(context);
    final searchData = aa.getallResturent;
    return Scaffold(
      appBar: CustomAppBar(text: 'Locations', context: context),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              cursorColor: AppColor.green,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColor.gray)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColor.gray)),
                  fillColor: Color.fromARGB(255, 233, 231, 231),
                  filled: true,
                  prefixIcon: Icon(
                    Icons.location_on,
                    color: AppColor.gray,
                  ),
                  hintText: 'Search new address'),
            ),
            App_Service.add_Height(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent address',
                  style: AppTextStyle.fs16Light,
                ),
                Text(
                  'Clear all',
                  style: AppTextStyle.fs12Light,
                )
              ],
            ),
            Column(
                children: List.generate(
                    searchData.length,
                    (index) => ListTile(
                          leading: Icon(Icons.location_on),
                          title: Text(searchData[index].rest_address),
                        )))
          ],
        ),
      ),
    );
  }
}
