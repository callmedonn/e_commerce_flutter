import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:my_app/component/main_header_order.dart';
// import 'package:my_app/controller/order_controller.dart';
import 'package:my_app/controller/controllers.dart';
import 'package:my_app/controller/order_controller.dart';
import 'package:my_app/view/order/components/order_grid.dart';
import 'package:my_app/view/order/components/order_loading_grid.dart';

import 'package:image_picker/image_picker.dart';

class OrderScreen extends StatefulWidget {
  // const OrderScreen({Key? key}) : super(key: key);

  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  // const OrderScreen({Key? key}) : super(key: key);

  File? image;

  Future getImage() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image
    final XFile? imagePicked =
        await picker.pickImage(source: ImageSource.gallery);

    image = File(imagePicked!.path);
    setState(() {});
  }

  Future payment() async {
    EasyLoading.showSuccess('Success payment! waiting to delivery');
  }

  Future refresh() async {
    orderController.gettingOrder();
    await Future.delayed(Duration(seconds: 1));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const MainHeaderOrder(),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromARGB(255, 0, 119, 255)),
            ),
            onPressed: () async {
              await refresh();
            },
            child: const Padding(
              padding: EdgeInsets.all(0.0),
              child: Text(
                'Refresh',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
          Expanded(child: Obx(() {
            if (orderController.isOrderLoading.value) {
              return const OrderLoadingGrid();
            } else {
              if (orderController.orderList.isNotEmpty) {
                return OrderGrid(orders: orderController.orderList);
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/order_not_found.png'),
                    const SizedBox(height: 10),
                    const Text('Orders Not Found!')
                  ],
                );
              }
            }
          })),
          image != null
              ? Column(
                  children: [
                    Container(
                      child: Image.file(image!, fit: BoxFit.cover),
                      height: 90,
                    ),
                    Text(
                      "Status : ${orderController.orderFree.value?.status}",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                    SizedBox(height: 10.0),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 255, 114, 104)),
                      ),
                      onPressed: () async {
                        await getImage();
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(6.0),
                        child: Text(
                          'Payment Now',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    Text(
                      "Code Order : #FLO230001",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                    Text(
                      "Transfer Melalui BCA : 310037877652",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                    Text(
                      "Status : ${orderController.orderFree.value?.status}",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "Total: Rp. ${orderController.orderFree.value?.total}",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                    SizedBox(height: 10.0),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 255, 114, 104)),
                      ),
                      onPressed: () async {
                        await getImage();
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(6.0),
                        child: Text(
                          'upload proof of transfer',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
          SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
