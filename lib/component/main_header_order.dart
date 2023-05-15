import 'package:flutter/material.dart';
import 'package:my_app/controller/controllers.dart';
import 'package:my_app/view/history/history.dart';
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Order",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            width: 10,
          ),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromARGB(255, 255, 114, 104)),
            ),
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  historyController.getHistorys(
                      email: authController.user.value?.email);
                  return const HistoryScreen();
                }),
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(0.0),
              child: Text(
                'History Order',
                style: TextStyle(fontSize: 10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
