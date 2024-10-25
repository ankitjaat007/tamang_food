import 'package:flutter/material.dart';
import 'package:tamang_food/res/components/botton/coman_button.dart';
import 'package:tamang_food/res/helper/appservices.dart';
import 'package:tamang_food/res/helper/colors.dart';
import 'package:tamang_food/res/helper/images&icons.dart';
import 'package:tamang_food/res/helper/textStyle.dart';
import 'package:tamang_food/views/pages/account_setting/Payment%20Methods/Payment_Methods.dart';
import 'package:tamang_food/views/pages/payment/scancard.dart';
import 'package:tamang_food/views/widgets/oops_widget/custom_appBar.dart';

class Add_PaymentMethods extends StatelessWidget {
  const Add_PaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: '', context: context),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              Text(
                'Add your payment methods',
                style: AppTextStyle.fs24Semi_Bold,
              ),
              App_Service.add_Height(10),
              Text(
                'This card will only be charged when you place an order.',
                style: AppTextStyle.fs16Normal.copyWith(color: AppColor.gray),
                textAlign: TextAlign.center,
              ),
              App_Service.add_Height(10),
              TextFormField(
                keyboardType: TextInputType.number,
                maxLength: 16,
                decoration: InputDecoration(
                    hintText: '4343 4343 4343 4343',
                    contentPadding: EdgeInsets.all(0),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.gray)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.gray)),
                    fillColor: Color.fromARGB(255, 231, 228, 228),
                    filled: true,
                    prefixIcon: Image.asset(
                      AppIcons.card,
                      scale: 4,
                    )),
              ),
              App_Service.add_Height(10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      maxLength: 5,
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        hintText: 'MM/YY',
                        // contentPadding: EdgeInsets.symmetric(vertical: 2),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColor.gray)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColor.gray)),
                        fillColor: Color.fromARGB(255, 231, 228, 228),
                        filled: true,
                      ),
                    ),
                  ),
                  App_Service.add_Width(15),
                  Expanded(
                    child: TextFormField(
                      maxLength: 3,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'CVC',
                        // contentPadding: EdgeInsets.all(0),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColor.gray)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColor.gray)),
                        fillColor: Color.fromARGB(255, 231, 228, 228),
                        filled: true,
                      ),
                    ),
                  )
                ],
              ),
              Spacer(),
              Coman_IconButton(
                onpressed: () {
                  App_Service.push_to_screen(Payment_Methods(), context);
                },
                radius: 7,
                btnName: 'Add Card',
              ),
              TextButton.icon(
                  style: TextButton.styleFrom(
                      minimumSize:
                          Size(App_Service.getscreenwidth(context), 30),
                      backgroundColor: Colors.transparent,
                      side: BorderSide(color: AppColor.gray)),
                  onPressed: () {
                    App_Service.push_to_screen(Scan_card(), context);
                  },
                  icon: Image.asset(
                    AppIcons.camera,
                    scale: 5,
                  ),
                  label: Text(
                    'Scan Card',
                    style: TextStyle(color: AppColor.black),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
