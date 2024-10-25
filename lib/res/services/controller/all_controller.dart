import 'package:flutter/material.dart';
import 'package:tamang_food/res/services/models/all_models.dart';

class AllController extends ChangeNotifier {
  List<ResturentModel> _allResturent = [];

  // Get all resturent from getter
  List<ResturentModel> get getallResturent => _allResturent;

  // Set all Menu in _allResturent variable
  setRestaurantList(List<ResturentModel> resturent) {
    _allResturent = resturent;
    notifyListeners();
  }
  // =================================================================
  // food controler

  List<FoodModel> _allFood = [];

  // Get all resturent from getter
  List<FoodModel> get getallFood => _allFood;

  // Set all Menu in _allResturent variable
  setFoodList(List<FoodModel> food) {
    _allFood = food;
    notifyListeners();
  }
  // =================================================================

  List<OrderModel> _order = [];
  List<OrderModel> get order => _order;
  setOrderData(OrderModel model) {
    if (_order.any((e) => e.fmodel!.food_id == model.fmodel!.food_id)) {
      int index = _order.indexWhere(
          (element) => element.fmodel!.food_id == model.fmodel!.food_id);
      _order[index].orderquantity =
          _order[index].orderquantity! + model.orderquantity!;
    } else {
      _order.add(model);
    }
    notifyListeners();
  }

  // =================================================================
  // category controler

  List<CategoryModel> _allCategory = [];

  // Get all resturent from getter
  List<CategoryModel> get getallCategroy => _allCategory;

  // Set all Menu in _allResturent variable
  setCategoryList(List<CategoryModel> Category) {
    _allCategory = Category;
    notifyListeners();
  }

  // =================================================================
  // user controler
  dynamic _user;

  UserModel get getuser => _user;

  setUser(UserModel user) {
    _user = user;
    notifyListeners();
  }

  // ==========================================
  // ==========================================
  // ==========================================
  // fire base controler
  // ==========================================
  // ==========================================
  // ==========================================
}
