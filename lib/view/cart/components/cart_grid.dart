import 'package:flutter/material.dart';
import 'package:my_app/view/cart/components/cart_card.dart';

import '../../../model/cart.dart';

class CartGrid extends StatelessWidget {
  final List<Cart> carts;
  const CartGrid({Key? key, required this.carts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(10),
        itemCount: carts.length,
        itemBuilder: (context, index) => CartCard(cart: carts[index]),
      ),
    );
  }
}
