import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tamang_food/res/components/botton/coman_button.dart';
import 'package:tamang_food/res/services/controller/all_controller.dart';
import 'package:tamang_food/res/services/controller/consumer_provider.dart';
import 'package:tamang_food/res/services/models/all_models.dart';
import 'package:tamang_food/res/helper/appservices.dart';
import 'package:tamang_food/res/helper/colors.dart';
import 'package:tamang_food/res/helper/textStyle.dart';
import 'package:tamang_food/views/widgets/order/addToOrder.dart';

// ignore: must_be_immutable
class SingleFood extends StatelessWidget {
  FoodModel foodmodel;
  SingleFood({super.key, required this.foodmodel});

  // bool top_Cookied = false;
  @override
  Widget build(BuildContext context) {
    final cousumerData = Provider.of<Consumer_Data>(context);
    final provider = Provider.of<AllController>(context);
    final totalpriz = foodmodel.price * cousumerData.removeANDadd;
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Coman_IconButton(
          onpressed: () {
            App_Service.push_to_screen(Add_to_order(), context);
            provider.setOrderData(OrderModel(
                orderquantity: cousumerData.removeANDadd,
                price: totalpriz,
                fmodel: foodmodel));
          },
          radius: 10,
          btnName: 'Add to Order (\$$totalpriz)',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              Image.asset(
                foodmodel.food_img,
                fit: BoxFit.cover,
                width: App_Service.getscreenwidth(context),
                height: 320.sp,
              ),
              SafeArea(
                  child: InkWell(
                onTap: () {
                  App_Service.pop_screen(context);
                },
                child: Container(
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 137, 137, 137),
                      shape: BoxShape.circle),
                  child: Icon(
                    Icons.close,
                    color: AppColor.white,
                  ),
                ),
              ))
            ]),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    foodmodel.food_name,
                    style: AppTextStyle.fs24Semi_Bold,
                  ),
                  App_Service.add_Height(10),
                  Text(
                    foodmodel.description,
                    style:
                        AppTextStyle.fs16Normal.copyWith(color: AppColor.gray),
                  ),
                  App_Service.add_Height(10),
                  Text('\$\$   ●  ${foodmodel.food_tast}',
                      style: AppTextStyle.fs16Normal
                          .copyWith(color: AppColor.gray)),
                  App_Service.add_Height(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Choice of top Cookie',
                        style: AppTextStyle.fs20Light,
                      ),
                      TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor:
                                  Color.fromRGBO(248, 222, 175, 0.965)),
                          onPressed: () {
                            cousumerData.setTopcookie();
                            // setState(() {
                            //   top_Cookied = !top_Cookied;
                            // });
                          },
                          child: Text(
                            'Required',
                            style: TextStyle(color: AppColor.light_orange),
                          ))
                    ],
                  ),
                  cousumerData.showtopCookie == false
                      ? SizedBox()
                      : Column(
                          children: List.generate(
                              foodmodel.top_Cookied.length,
                              (index) => RadioListTile(
                                  shape: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: AppColor.gray)),
                                  title: Text(foodmodel.top_Cookied[index]),
                                  value: foodmodel.top_Cookied[index],
                                  groupValue: cousumerData.cookie,
                                  onChanged: (v) {
                                    cousumerData.setCookie(v.toString());
                                    // setState(() {});
                                    // aaa = v.toString();
                                  }))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Choice of Bottom Cookie',
                        style: AppTextStyle.fs20Light,
                      ),
                      TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor:
                                  Color.fromRGBO(248, 222, 175, 0.965)),
                          onPressed: () {
                            cousumerData.setBootomcookie();
                            // setState(() {
                            //   bottom_Cookied = !bottom_Cookied;
                            // });
                          },
                          child: Text(
                            'Required',
                            style: TextStyle(color: AppColor.light_orange),
                          ))
                    ],
                  ),
                  cousumerData.showbootomCookie == false
                      ? SizedBox()
                      : Column(
                          children: List.generate(
                              foodmodel.bottom_Cookied.length,
                              (index) => RadioListTile(
                                  shape: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: AppColor.gray)),
                                  title: Text(foodmodel.bottom_Cookied[index]),
                                  value: foodmodel.bottom_Cookied[index],
                                  groupValue: cousumerData.cookie,
                                  onChanged: (v) {
                                    cousumerData.setCookie(v.toString());
                                    // aaa = v.toString();
                                    // setState(() {});
                                  }))),
                  ListTile(
                    title: Text('Add Special Instructions'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    shape: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColor.gray)),
                  ),
                  App_Service.add_Height(20),
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () {
                            cousumerData.setremoveNumber();
                          },
                          child: Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColor.gray),
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 232, 231, 228)),
                            child: Icon(Icons.remove),
                          ),
                        ),
                        Text(cousumerData.removeANDadd.toString()),
                        InkWell(
                          onTap: () {
                            cousumerData.setaddNumber();
                          },
                          child: Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColor.gray),
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 232, 231, 228)),
                            child: Icon(Icons.add),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
