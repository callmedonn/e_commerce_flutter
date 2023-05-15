import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/component/main_header_history.dart';
// import 'package:my_app/controller/history_controller.dart';
import 'package:my_app/controller/controllers.dart';
import 'package:my_app/view/history/components/history_grid.dart';
import 'package:my_app/view/history/components/history_loading_grid.dart';

import 'package:image_picker/image_picker.dart';
import 'package:my_app/view/home/home_screen.dart';

class HistoryScreen extends StatefulWidget {
  // const HistoryScreen({Key? key}) : super(key: key);

  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  // const HistoryScreen({Key? key}) : super(key: key);

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
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      orderController.getOrders(email: authController.user.value?.email);
      return const HomeScreen();
    }));
  }

  Future refresh() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const MainHeaderHistory(),
          Expanded(child: Obx(() {
            if (historyController.isHistoryLoading.value) {
              return const HistoryLoadingGrid();
            } else {
              if (historyController.historyList.isNotEmpty) {
                return HistoryGrid(historys: historyController.historyList);
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/history_not_found.png'),
                    const SizedBox(height: 10),
                    const Text('History Not Found!')
                  ],
                );
              }
            }
          })),
          SizedBox(height: 10.0),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromARGB(255, 255, 114, 104)),
            ),
            onPressed: () async {
              await payment();
            },
            child: const Padding(
              padding: EdgeInsets.all(6.0),
              child: Text(
                'Back Home',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
