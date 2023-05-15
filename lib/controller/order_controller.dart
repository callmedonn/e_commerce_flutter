import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_app/model/order.dart';
import 'package:my_app/model/orderFree.dart';
import 'package:my_app/service/remote_service/remote_order.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class OrderController extends GetxController {
  static OrderController instance = Get.put(OrderController());
  TextEditingController searchTextEditController = TextEditingController();
  RxString searchVal = ''.obs;
  Rxn<OrderFree> orderFree = Rxn<OrderFree>();

  RxList<Order> orderList = List<Order>.empty(growable: true).obs;
  RxBool isOrderLoading = false.obs;

  @override
  void onInit() {
    getOrders(email: null);
    gettingOrder();
    super.onInit();
  }

  void addOrder({required email}) async {
    try {
      if (email != null) {
        var result = await RemoteOrderService().addOrder(
          email: email,
        );
        if (result.statusCode == 200) {
          // orderFree.value = orderFreeFromJson(result.body);

          var resultGetMe = await RemoteOrderService().getMe();
          orderFree.value = orderFreeFromJson(resultGetMe.body);
          EasyLoading.showSuccess('Success add order!');
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

  void gettingOrder() async {
    try {
      print("objecewfewft");
      var resultGetMe = await RemoteOrderService().getMe();
      orderFree.value = orderFreeFromJson(resultGetMe.body);
    } catch (e) {
      debugPrint(e.toString());
    } finally {}
  }

  void getOrders({required email}) async {
    try {
      isOrderLoading(true);
      var result = await RemoteOrderService().getOrder(email: email);
      // print(orderListFromJson(result.body).length);
      if (result != null) {
        orderList.assignAll(orderListFromJson(result.body));
      }

      return orderList.assignAll(orderListFromJson(result.body));
    } finally {
      isOrderLoading(false);
    }
  }

  void getOrderByName() async {
    try {
      isOrderLoading(true);
      var result = await RemoteOrderService().getByName(keyword: "keyword");
      if (result != null) {
        orderList.assignAll(orderListFromJson(result.body));
      }
    } finally {
      isOrderLoading(false);
      print(orderList.length);
    }
  }

  void getOrderByCategory({required int id}) async {
    try {
      isOrderLoading(true);
      var result = await RemoteOrderService().getByCategory(id: id);
      if (result != null) {
        orderList.assignAll(orderListFromJson(result.body));
      }
    } finally {
      isOrderLoading(false);
      print(orderList.length);
    }
  }
}
