import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamang_food/res/services/controller/all_controller.dart';

import '../models/all_models.dart';

class AllFilterFunction extends ChangeNotifier {
  // -----------------------------------------------
  // Resturent data filter
  // ----------------------------------------------

  // ================================================
  // filter=> Featured_Partners Resturent
  List<ResturentModel> Featured_Partners(BuildContext context) {
    var aa = Provider.of<AllController>(context, listen: false);
    var rest_data = aa.getallResturent;
    return rest_data
        .where((element) => element.rest_type == 'Featured_Partners')
        .toList();
  }

  // ================================================
  // filter=> search-rating Resturent
  List<ResturentModel> searchRestRating(BuildContext context, double value) {
    var aa = Provider.of<AllController>(context, listen: false);
    var rest_data = aa.getallResturent;
    return rest_data.where((element) => element.rest_rating == value).toList();
  }
  // -----------------------------------------------
  // food data filter
  // ----------------------------------------------

  // ================================================
  // filter=> Featured_items food
  List<FoodModel> featured_items(BuildContext context) {
    var aa = Provider.of<AllController>(context, listen: false);
    var food_data = aa.getallFood;
    return food_data
        .where((element) => element.food_type == 'Featured_items')
        .toList();
  }

  // -----------------------------------------------
  // categry all data filter
  // ----------------------------------------------
  /* getSelectedCategory(BuildContext context) {
    final aa = Provider.of<AllController>(context, listen: false);
    return aa.getallCategroy.isNotEmpty ? aa.getallCategroy.first : null;
  }

  filterCategory(BuildContext context) {
    late CategoryModel? selectedCategory = getSelectedCategory(context);
    final aa = Provider.of<AllController>(context);
    final filterFood = aa.getallFood
        .where((e) => e.rest_id == aa.getallResturent.map((e) => e.rest_id))
        .toList();
    return selectedCategory == null
        ? filterFood
        : filterFood
            .where((element) => element.cat_id == selectedCategory.cat_id)
            .toList();
  }*/
}
