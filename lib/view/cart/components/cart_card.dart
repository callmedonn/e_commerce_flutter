import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_app/const.dart';
import 'package:shimmer/shimmer.dart';

import '../../../model/cart.dart';
// import '../../cart_details/cart_details_screen.dart';

class CartCard extends StatelessWidget {
  final Cart cart;
  const CartCard({Key? key, required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () {
      //   FocusScope.of(context).requestFocus(FocusNode());
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => CartDetailsScreen(cart: cart)));
      // },
      child: Material(
        elevation: 2,
        shadowColor: const Color.fromARGB(172, 224, 224, 224),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 5,
                child: Center(
                  child: Hero(
                    tag: cart.images.first,
                    child: CachedNetworkImage(
                      imageUrl: baseUrl + cart.images.first,
                      placeholder: (context, url) => Shimmer.fromColors(
                        highlightColor: Colors.white,
                        baseColor: Colors.grey.shade300,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          color: Colors.grey.shade300,
                        ),
                      ),
                      errorWidget: (context, url, error) => const Center(
                        child: Icon(
                          Icons.error_outline,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Flexible(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      cart.name,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 255, 114, 104)),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Rp. ${cart.tags.first.price}',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Text(
                      'Qty : 1',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
