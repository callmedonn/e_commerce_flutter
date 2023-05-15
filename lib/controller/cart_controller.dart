import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_app/model/cart.dart';
import 'package:my_app/service/remote_service/remote_cart.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CartController extends GetxController {
  static CartController instance = Get.put(CartController());
  TextEditingController searchTextEditController = TextEditingController();
  RxString searchVal = ''.obs;
  RxList<Cart> cartList = List<Cart>.empty(growable: true).obs;
  RxBool isCartLoading = false.obs;

  @override
  void onInit() {
    getCarts(email: null);
    super.onInit();
  }

  void addCart({required product, required email}) async {
    try {
      if (email != null) {
        var result = await RemoteCartService().addToCart(
          product: product,
          email: email,
        );
        if (result.statusCode == 200) {
          EasyLoading.showSuccess('Success add cart!');
        } else {
          EasyLoading.showError('Internal Server Error');
        }
      } else {
        EasyLoading.showError('Please Login');
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {}
  }

  void getCarts({required email}) async {
    try {
      isCartLoading(true);
      var result = await RemoteCartService().getCart(email: email);
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
