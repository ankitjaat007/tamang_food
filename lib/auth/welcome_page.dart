import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamang_food/res/components/botton/coman_button.dart';
import 'package:tamang_food/res/services/functions/all_functions.dart';
import 'package:tamang_food/res/helper/appConfig.dart';
import 'package:tamang_food/res/helper/textStyle.dart';
import 'package:tamang_food/utils/routes/routes_name.dart';

class Welcome_page extends StatefulWidget {
  const Welcome_page({super.key});

  @override
  State<Welcome_page> createState() => _Welcome_pageState();
}

class _Welcome_pageState extends State<Welcome_page> {
  @override
  void initState() {
    super.initState();
    initialize();
  }

  initialize() async {
    await AllFunctions.getallResturent(context);
    await AllFunctions.getallFood(context);
    await AllFunctions.getallCategroy(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppConfig.welcome_bg,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height.h,
            width: MediaQuery.of(context).size.width.w,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Gap(100.h),
                SizedBox(),
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
                // Gap(40.h),
                Image.asset(AppConfig.welcome_ads),
                // Gap(30.h),
                Text(
                  'Welcome',
                  style: AppTextStyle.fs28Bold,
                ),
                // Gap(30.h),
                Text(
                    'It’s a pleasure to meet you. We are excited that you’re here so let’s get started!',
                    textAlign: TextAlign.center),
                // Gap(30.h),
                Coman_IconButton(
                  onpressed: () {
                    Navigator.pushNamed(context, RouteName.boarding_page);
                    // Navigator.pushNamedAndRemoveUntil(
                    //     context, RouteName.boarding_page, (route) => false);
                  },
                  radius: 10,
                  btnName: 'Get Started',
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
