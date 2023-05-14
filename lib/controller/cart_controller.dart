import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_app/model/cart.dart';
import 'package:my_app/service/remote_service/remote_cart.dart';

class CartController extends GetxController {
  static CartController instance = Get.put(CartController());
  TextEditingController searchTextEditController = TextEditingController();
  RxString searchVal = ''.obs;
  RxList<Cart> cartList = List<Cart>.empty(growable: true).obs;
  RxBool isCartLoading = false.obs;

  @override
  void onInit() {
    getCarts();
    super.onInit();
  }

  getCarts() async {
    try {
      isCartLoading(true);
      var result = await RemoteCartService().getCart();
      // print(cartListFromJson(result.body).length);
      if (result != null) {
        cartList.assignAll(cartListFromJson(result.body));
      }

      return cartList.assignAll(cartListFromJson(result.body));
    } finally {
      isCartLoading(false);
    }
  }

  void getCartByName() async {
    try {
      isCartLoading(true);
      print("object guys");
      var result = await RemoteCartService().getByName(keyword: "keyword");
      if (result != null) {
        cartList.assignAll(cartListFromJson(result.body));
      }
    } finally {
      isCartLoading(false);
      print(cartList.length);
    }
  }

  void getCartByCategory({required int id}) async {
    try {
      isCartLoading(true);
      var result = await RemoteCartService().getByCategory(id: id);
      if (result != null) {
        cartList.assignAll(cartListFromJson(result.body));
      }
    } finally {
      isCartLoading(false);
      print(cartList.length);
    }
  }
}
