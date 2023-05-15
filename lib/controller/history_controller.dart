import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_app/model/history.dart';
import 'package:my_app/service/remote_service/remote_history.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class HistoryController extends GetxController {
  static HistoryController instance = Get.put(HistoryController());
  TextEditingController searchTextEditController = TextEditingController();
  RxString searchVal = ''.obs;

  RxList<History> historyList = List<History>.empty(growable: true).obs;
  RxBool isHistoryLoading = false.obs;

  @override
  void onInit() {
    getHistorys(email: null);

    super.onInit();
  }

  void addHistory({required email}) async {
    try {
      if (email != null) {
        var result = await RemoteHistoryService().addHistory(
          email: email,
        );
        if (result.statusCode == 200) {
          // historyFree.value = historyFreeFromJson(result.body);

          EasyLoading.showSuccess('Success add history!');
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

  void getHistorys({required email}) async {
    try {
      isHistoryLoading(true);
      var result = await RemoteHistoryService().getHistory(email: email);
      // print(historyListFromJson(result.body).length);
      print("result");
      print(result.body);
      if (result != null) {
        historyList.assignAll(historyListFromJson(result.body));
      }

      return historyList.assignAll(historyListFromJson(result.body));
    } finally {
      isHistoryLoading(false);
    }
  }

  void getHistoryByName() async {
    try {
      isHistoryLoading(true);
      var result = await RemoteHistoryService().getByName(keyword: "keyword");
      if (result != null) {
        historyList.assignAll(historyListFromJson(result.body));
      }
    } finally {
      isHistoryLoading(false);
      print(historyList.length);
    }
  }

  void getHistoryByCategory({required int id}) async {
    try {
      isHistoryLoading(true);
      var result = await RemoteHistoryService().getByCategory(id: id);
      if (result != null) {
        historyList.assignAll(historyListFromJson(result.body));
      }
    } finally {
      isHistoryLoading(false);
      print(historyList.length);
    }
  }
}
