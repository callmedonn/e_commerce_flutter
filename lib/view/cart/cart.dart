import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/component/main_header_cart.dart';
// import 'package:my_app/controller/cart_controller.dart';
import 'package:my_app/controller/controllers.dart';
import 'package:my_app/view/account/auth/sign_in_screen.dart';
import 'package:my_app/view/cart/components/cart_grid.dart';
import 'package:my_app/view/cart/components/cart_loading_grid.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

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
                cartController.getCarts();
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
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromARGB(255, 255, 114, 104)),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SignInScreen()));
            },
            child: const Padding(
              padding: EdgeInsets.all(6.0),
              child: Text(
                'Checkout',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SignInScreen()));
            },
            child: const Padding(
              padding: EdgeInsets.all(0.0),
              child: Text(
                '',
                style: TextStyle(fontSize: 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
