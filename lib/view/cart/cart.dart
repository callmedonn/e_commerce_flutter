// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/component/main_header_cart.dart';
import 'package:my_app/controller/controllers.dart';
import 'package:my_app/view/cart/components/cart_grid.dart';
import 'package:my_app/view/cart/components/cart_loading_grid.dart';
import 'package:my_app/view/order/order.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  // Rxn<OrderFree> orderFree = Rxn<OrderFree>();

  Future addOrder(context) async {
    orderController.addOrder(email: authController.user.value?.email);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      orderController.getOrders(email: authController.user.value?.email);
      return const OrderScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const MainHeaderCart(),
          Expanded(child: Obx(() {
            if (cartController.isCartLoading.value) {
              return const CartLoadingGrid();
            } else {
              if (cartController.cartList.isNotEmpty) {
                return CartGrid(carts: cartController.cartList);
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/cart_not_found.png'),
                    const SizedBox(height: 10),
                    const Text('Carts Not Found!')
                  ],
                );
              }
            }
          })),
          authController.user.value != null
              ? TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 255, 114, 104)),
                  ),
                  onPressed: () async {
                    await addOrder(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Text(
                      'Checkout',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                )
              : Container(),
          SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
