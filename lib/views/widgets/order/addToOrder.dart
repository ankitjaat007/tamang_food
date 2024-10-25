import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamang_food/res/services/controller/all_controller.dart';
import 'package:tamang_food/res/helper/appservices.dart';
import 'package:tamang_food/res/helper/colors.dart';
import 'package:tamang_food/views/pages/payment/AddPaymentMethods.dart';
import 'package:tamang_food/views/widgets/oops_widget/custom_appBar.dart';

import '../../../res/components/botton/coman_button.dart';
import '../../../res/helper/textStyle.dart';

// ignore: must_be_immutable
class Add_to_order extends StatelessWidget {
  Add_to_order({super.key});

  @override
  Widget build(BuildContext context) {
    final orderdata = Provider.of<AllController>(context).order;
    final subtotal = orderdata
        .map((e) => e.price)
        .reduce((value, element) => value! + element!);
    final delivery = orderdata.first.fmodel!.food_delivery;
    final total = subtotal! + delivery;
    // print(delivery);

    return Scaffold(
        appBar: CustomAppBar(text: 'Your Orders', context: context),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                ...List.generate(
                    orderdata.length,
                    (index) => ListTile(
                          shape: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColor.gray)),
                          contentPadding: EdgeInsets.all(0),
                          leading: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    border: Border.all(color: AppColor.gray),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text(
                                  "${orderdata[index].orderquantity}",
                                  style:
                                      TextStyle(color: AppColor.light_orange),
                                ),
                              ),
                            ],
                          ),
                          title: Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(orderdata[index].fmodel!.food_name),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Text(orderdata[index].fmodel!.description),
                          ),
                          trailing: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('AUD\$${orderdata[index].price}',
                                  style: AppTextStyle.fs16Normal
                                      .copyWith(color: AppColor.light_orange)),
                            ],
                          ),
                        )),
                App_Service.add_Height(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Subtotal',
                      style: AppTextStyle.fs16Normal,
                    ),
                    Text(
                      'AUD\$$subtotal',
                      style: AppTextStyle.fs16Normal,
                    )
                  ],
                ),
                App_Service.add_Height(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Delivery',
                      style: AppTextStyle.fs16Normal,
                    ),
                    Text(
                      '\$$delivery',
                      style: AppTextStyle.fs16Normal,
                    )
                  ],
                ),
                App_Service.add_Height(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'AUD\$$total',
                      style: AppTextStyle.fs14Semi_Bold
                          .copyWith(color: AppColor.light_orange),
                    ),
                  ],
                ),
                App_Service.add_Height(10),
                ListTile(
                  textColor: AppColor.light_orange,
                  contentPadding: EdgeInsets.all(0),
                  title: Text('Add more items'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  shape: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColor.gray)),
                ),
                App_Service.add_Height(10),
                ListTile(
                  textColor: AppColor.black,
                  contentPadding: EdgeInsets.all(0),
                  title: Text('Promo code'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  shape: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColor.gray)),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Coman_IconButton(
            onpressed: () {
              // showModalBottomSheet(
              //   backgroundColor: Color(0xffF8EDDC),
              //   shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.only(
              //           topLeft: Radius.circular(30),
              //           topRight: Radius.circular(30))),
              //   context: context,
              //   builder: (context) => Padding(
              //     padding: const EdgeInsets.all(20),
              //     child: Column(
              //       mainAxisSize: MainAxisSize.min,
              //       children: [
              //         Text(
              //           'You Place the Order\nSuccessfully',
              //           style: AppTextStyle.fs20Light,
              //           textAlign: TextAlign.center,
              //         ),
              //         App_Service.add_Height(20),
              //         Text(
              //           'You placed the order successfully. You will get\nyour food within 25 minutes. Thanks for using\nour services. Enjoy your food :)',
              //           style: AppTextStyle.fs16Normal
              //               .copyWith(color: AppColor.gray),
              //           textAlign: TextAlign.center,
              //         ),
              //         App_Service.add_Height(20),
              //         TextButton(
              //             onPressed: () {},
              //             child: Text(
              //               'Keep Browsing',
              //               style: AppTextStyle.fs12Semi_Bold
              //                   .copyWith(color: AppColor.light_orange),
              //             ))
              //       ],
              //     ),
              //   ),
              // );
              App_Service.push_to_screen(Add_PaymentMethods(), context);
            },
            radius: 10,
            btnName: 'Continue (AUD \$$total)',
          ),
        ));
  }
}
