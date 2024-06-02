import 'package:flutter/foundation.dart';

import '../model/fake_data.dart';
import '../model/model.dart';


class BurgerController extends ChangeNotifier {
  burgermodel model = burgermodel.fromJson(fakeData);
  List<Data?>? cartList = [];

  addToCart(Data? burgerdata) {
  
    cartList!.contains(burgerdata) ? null : cartList?.add(burgerdata);
    notifyListeners();
  }

  removeFromCart(Data? value) {
    cartList?.remove(value);
    notifyListeners();
  }

  icreament(Data? burgerdata) {
    burgerdata!.quantity = burgerdata.quantity! + 1;
    notifyListeners();
  }

  decreament(Data? burgerdata) {
    burgerdata!.quantity = burgerdata.quantity! - 1;
    if (burgerdata.quantity == 0) {
      removeFromCart(burgerdata);
    }
    notifyListeners();
  }
}
