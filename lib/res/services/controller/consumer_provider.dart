import 'package:flutter/material.dart';

class Consumer_Data extends ChangeNotifier {
  int _indexNumber = 0;
  int get indexNumber => _indexNumber;
  setindexNumber(int number) {
    _indexNumber = number;
    notifyListeners();
  }

// ===========================================
  int _indexallrest = 0;
  int get indexallRest => _indexallrest;
  setindexallrext(int number) {
    _indexallrest = number;
    notifyListeners();
  }

// ============================================
  int _removeANDadd = 1;
  int get removeANDadd => _removeANDadd;
  setremoveNumber() {
    if (_removeANDadd != 1) {
      _removeANDadd--;
    }
    // print(_removeANDadd);
    notifyListeners();
  }

  setaddNumber() {
    _removeANDadd++;
    notifyListeners();
  }

// ==============================================
  String _cookie = '';
  String get cookie => _cookie;
  setCookie(String value) {
    _cookie = value;
    notifyListeners();
  }

// =============================================
  bool _showtopCookie = false;
  bool get showtopCookie => _showtopCookie;
  setTopcookie() {
    _showtopCookie = !_showtopCookie;
    notifyListeners();
  }

  bool _showbootomCookie = false;
  bool get showbootomCookie => _showbootomCookie;
  setBootomcookie() {
    _showbootomCookie = !_showbootomCookie;
    notifyListeners();
  }

//================================================
  int _categoriesNumber = 0;
  int get categoriesNumber => _categoriesNumber;
  setcategoriesNumber(int number) {
    _categoriesNumber = number;
    notifyListeners();
  }

  int _diratryNumber = 0;
  int get diratryNumber => _diratryNumber;
  setdiratryNumber(int number) {
    _diratryNumber = number;
    notifyListeners();
  }

  int _prizeRange = 0;
  int get prizeRange => _prizeRange;
  setprizeRange(int number) {
    _prizeRange = number;
    notifyListeners();
  }
}
