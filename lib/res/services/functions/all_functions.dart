import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tamang_food/res/services/controller/all_controller.dart';
import 'package:tamang_food/res/services/models/all_models.dart';

class AllFunctions {
  static getallResturent(BuildContext context) async {
    final ab = Provider.of<AllController>(context, listen: false);
    List<ResturentModel> data = [];
    var respond = await rootBundle.loadString('assets/jsons/resturent.json');
    var jsondata = jsonDecode(respond) as List;
    // print(jsondata.map((e) => e));
    data = jsondata.map((e) => ResturentModel.fromModelList(e)).toList();
    ab.setRestaurantList(data);
  }

  // =====================================================================
  // food function
  //
  static getallFood(BuildContext context) async {
    final ab = Provider.of<AllController>(context, listen: false);
    List<FoodModel> data = [];
    var respond = await rootBundle.loadString('assets/jsons/food.json');
    var jsondata = jsonDecode(respond) as List;
    // print(jsondata.map((e) => e));
    data = jsondata.map((e) => FoodModel.fromModelList(e)).toList();
    ab.setFoodList(data);
  }

  // =====================================================================
  // category function
  //
  static getallCategroy(BuildContext context) async {
    final ab = Provider.of<AllController>(context, listen: false);
    List<CategoryModel> data = [];
    var respond = await rootBundle.loadString('assets/jsons/category.json');
    var jsondata = jsonDecode(respond) as List;
    // print(jsondata.map((e) => e));
    data = jsondata.map((e) => CategoryModel.fromModelList(e)).toList();
    ab.setCategoryList(data);
  }

  // =====================================================================
  // user function
  //
  static getalluser(BuildContext context, String email, String password) async {
    final ab = Provider.of<AllController>(context, listen: false);
    var respond = await rootBundle.loadString('assets/jsons/user.json');
    var jsondata = jsonDecode(respond) as List;
    // print(jsondata.map((e) => e));

    final useremailVrify =
        jsondata.where((element) => element["email"] == email);
    if (useremailVrify.isNotEmpty) {
      var user = useremailVrify.first["password"] == password;
      if (user) {
        var data = UserModel.fromModelList(useremailVrify.first);
        ab.setUser(data);
        print("Login User");
      } else {
        print("password is wrong");
      }
    } else {
      print("Email not regester");
    }
  }
}

// ====================================================================
// ====================================================================
// -------get data on firebase
// ====================================================================
// ====================================================================

