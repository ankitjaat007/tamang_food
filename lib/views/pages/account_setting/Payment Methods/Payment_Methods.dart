import 'package:flutter/material.dart';
import 'package:tamang_food/res/components/botton/coman_button.dart';
import 'package:tamang_food/res/helper/appservices.dart';
import 'package:tamang_food/res/helper/colors.dart';
import 'package:tamang_food/res/helper/images&icons.dart';
import 'package:tamang_food/res/helper/textStyle.dart';
import 'package:tamang_food/utils/routes/routes_name.dart';
import 'package:tamang_food/views/widgets/oops_widget/custom_appBar.dart';

class Payment_Methods extends StatelessWidget {
  const Payment_Methods({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: 'Payment Methods', context: context),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppIcons.wallet),
            App_Service.add_Height(10),
            Text(
              'Don’t have any card :)',
              style: AppTextStyle.fs24Semi_Bold,
            ),
            App_Service.add_Height(10),
            Text(
              'It’s seems like you have not added any\ncredit or debit card. You may easily add card.',
              style: AppTextStyle.fs16Normal.copyWith(color: AppColor.gray),
              textAlign: TextAlign.center,
            ),
            App_Service.add_Height(10),
            Coman_IconButton(
              onpressed: () {
                // App_Service.push_and_replace(Card_list(), context);
                Navigator.pushNamed(context, RouteName.card_list);
              },
              radius: 5,
              width: 0.8,
              textclr: AppColor.light_orange,
              borderclr: AppColor.light_orange,
              bgcolor: Colors.transparent,
              btnName: 'Add credit cards',
            )
          ],
        ),
      ),
    );
  }
}
