import 'package:flutter/material.dart';
import 'package:tamang_food/res/helper/appservices.dart';
import 'package:tamang_food/res/helper/colors.dart';
import 'package:tamang_food/res/helper/textStyle.dart';
import 'package:tamang_food/views/widgets/oops_widget/custom_appBar.dart';

class Scan_card extends StatelessWidget {
  const Scan_card({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(text: '', context: context),
      body: Stack(children: [
        Image.asset(
          'assets/images/scan_card.png',
          fit: BoxFit.cover,
          height: App_Service.getscreenheight(context),
          width: App_Service.getscreenwidth(context),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Column(
                children: [
                  Text(
                    'Scan Your Card :)',
                    style: AppTextStyle.fs24Semi_Bold
                        .copyWith(color: AppColor.white),
                  ),
                  App_Service.add_Height(10),
                  Text(
                    'Just my luck, no ice. Must go faster. Did he just throw my cat out of the window',
                    style:
                        AppTextStyle.fs16Normal.copyWith(color: AppColor.gray),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
