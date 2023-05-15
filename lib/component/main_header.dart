import 'package:badges/src/badge.dart' as badges;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/controller/cart_controller.dart';
import 'package:my_app/controller/controllers.dart';
// import 'package:my_app/service/remote_service/remote_cart.dart';
import 'package:my_app/view/cart/cart.dart';
import 'package:my_app/view/history/history.dart';
// import 'package:my_app/view/cart/cart.dart';
// import 'package:my_app/view/product/product_screen.dart';
// import 'package:my_app/view/account/auth/sign_in_screen.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
        BoxShadow(color: Colors.grey.withOpacity(0.4), blurRadius: 10)
      ]),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(24)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      offset: const Offset(0, 0),
                      blurRadius: 5)
                ]),
            child: Obx(() => TextField(
                  autofocus: false,
                  controller: productController.searchTextEditController,
                  onSubmitted: (val) {
                    productController.getProductByName(keyword: val);
                    dashboardController.updateIndex(1);
                  },
                  onChanged: (val) {
                    productController.searchVal.value = val;
                  },
                  decoration: InputDecoration(
                      suffixIcon: productController.searchVal.value.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                productController.searchTextEditController
                                    .clear();
                                productController.searchVal.value = '';
                                productController.getProducts();
                              },
                            )
                          : null,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 16),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide.none),
                      hintText: "Search...",
                      prefixIcon: const Icon(Icons.search)),
                )),
          )),
          const SizedBox(width: 10),
          Container(
            height: 46,
            width: 46,
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: <BoxShadow>[
                  BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 8)
                ]),
            padding: const EdgeInsets.all(12),
            child: const Icon(
              Icons.filter_alt_outlined,
              color: Colors.grey,
            ),
          ),
          const SizedBox(width: 10),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    CartController().onInit();
                    // RemoteCartService().getByName(keyword: "keyword");
                    cartController.getCarts(
                        email: authController.user.value?.email);
                    return const CartScreen();
                  }),
                );
              },
              child: badges.Badge(
                badgeContent: const Text(
                  "",
                  style: TextStyle(color: Colors.white),
                ),
                badgeColor: Colors.white,
                child: Container(
                  height: 46,
                  width: 46,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.3), blurRadius: 8)
                      ]),
                  padding: const EdgeInsets.all(12),
                  child: const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.grey,
                  ),
                ),
              )),
          const SizedBox(width: 5),
        ],
      ),
    );
  }
}
