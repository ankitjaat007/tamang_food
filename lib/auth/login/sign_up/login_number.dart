import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:tamang_food/res/components/botton/coman_button.dart';
import 'package:tamang_food/res/helper/colors.dart';
import 'package:tamang_food/res/helper/textStyle.dart';
import 'package:tamang_food/utils/routes/routes_name.dart';

import '../../../views/widgets/oops_widget/custom_appBar.dart';

class Login_number_page extends StatelessWidget {
  const Login_number_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: 'Login to Tamang Food\nServices',
        context: context,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(20.h),
                Center(
                  child: Text(
                    'Get started with Foodly',
                    style: AppTextStyle.fs24Semi_Bold,
                  ),
                ),
                Gap(15.h),
                Center(
                  child: Text(
                    'Enter your phone number to use foodly and\nenjoy your food :)',
                    style: TextStyle(color: AppColor.gray),
                    textAlign: TextAlign.center,
                  ),
                ),
                Gap(15.h),
                Text('Phone Number',
                    style:
                        AppTextStyle.fs12Light.copyWith(color: AppColor.gray)),
                IntlPhoneField(
                  keyboardType: TextInputType.number,
                  cursorColor: AppColor.green,
                  dropdownIconPosition: IconPosition.trailing,
                  initialCountryCode: 'AU',
                  decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColor.black))),
                ),
              ],
            ),
            Coman_IconButton(
              onpressed: () {
                // App_Service.push_to_screen(Confirm_number_page(), context);
                Navigator.pushNamed(context, RouteName.confirm_number_page);
              },
              radius: 10,
              btnName: 'Sign up',
            )
          ],
        ),
      ),
    );
  }
}
