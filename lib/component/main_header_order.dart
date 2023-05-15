import 'package:flutter/material.dart';
// import 'package:my_app/view/order/order.dart';
// import 'package:my_app/view/product/product_screen.dart';
// import 'package:my_app/view/account/auth/sign_in_screen.dart';

class MainHeaderOrder extends StatelessWidget {
  const MainHeaderOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
        BoxShadow(color: Colors.grey.withOpacity(0.4), blurRadius: 10)
      ]),
      padding: const EdgeInsets.all(10),
      child: Text(
        "Order",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      ),
    );
  }
}
