import 'package:flutter/material.dart';

class DummyData {
  List<Map<String, dynamic>> boarding_Data = [
    {
      "image": "assets/images/boarding1.png",
      "title": "All your favorites",
      "subtitle":
          "Order from the best local restaurants with easy, on-demand delivery."
    },
    {
      "image": "assets/images/boarding2.png",
      "title": "Free delivery offers",
      "subtitle":
          "Free delivery for new customers via Apple Pay and others payment methods."
    },
    {
      "image": "assets/images/boarding3.png",
      "title": "Choose your food",
      "subtitle":
          "Easily find your type of food craving and you’ll get delivery in wide range."
    },
  ];
  List<Map<String, dynamic>> account_Settings = [
    {
      "icon": Icons.person,
      "title": "Profile Information",
      "subtitle": "Change your account information",
      "id": "person"
    },
    {
      "icon": Icons.lock,
      "title": "Change Password",
      "subtitle": "Change your password",
      "id": "lock"
    },
    {
      "icon": Icons.wallet,
      "title": "Payment Methods",
      "subtitle": "Add your credit & debit cards",
      "id": "wallet"
    },
    {
      "icon": Icons.location_on,
      "title": "Locations",
      "subtitle": "Add or remove your delivery locations",
      "id": "location_on"
    },
    {
      "icon": Icons.facebook,
      "title": "Add Social Account",
      "subtitle": "Add Facebook, Twitter etc ",
      "id": "facebook"
    },
    {
      "icon": Icons.refresh,
      "title": "Refer to Friends",
      "subtitle": "Get \$10 for reffering friends",
      "id": "refresh"
    },
  ];
  List<Map<String, dynamic>> cardList = [
    {
      "iconImg": 'assets/icons/paypal.png',
      "title": "PayPal",
      "subtitle": "Deafult Payment",
      "id": "paypal"
    },
    {
      "iconImg": 'assets/icons/mastercard.png',
      "title": "MasterCard",
      "subtitle": "Not Deafult",
      "id": "mastercard"
    },
    {
      "iconImg": 'assets/icons/visa.png',
      "title": "Visa",
      "subtitle": "Not Deafult",
      "id": "visa"
    },
  ];
  List<String> filterCategories = [
    "All",
    "Brunch",
    'Dinner',
    'Burgers',
    'Chinese',
    'Pizza',
    'Salads',
    'Soups',
    'Breakfast'
  ];
  List<String> filterDietary = ["any", "Vegetarian", 'Vegan', 'Gluten-Free'];
  List<String> filterprice_range = [
    "\$",
    "\$\$",
    '\$\$\$',
    '\$\$\$\$',
    '\$\$\$\$\$'
  ];
}
