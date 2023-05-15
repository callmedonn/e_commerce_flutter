import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_app/const.dart';

class RemoteHistoryService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/historys';
  var remoteUrlCart = '$baseUrl/api/carts';
  var remoteUrlHistory = '$baseUrl/api/orders';

  Future<dynamic> getHistory({required email}) async {
    print(email);
    print("email");
    var response = await client.get(Uri.parse(
        '$remoteUrlHistory?populate=status_order&filters[email][\$contains]=$email'));

    return response;
  }

  Future<dynamic> addHistory({required email}) async {
    var body = {"email": email};
    var response = await client.post(
      Uri.parse('$baseUrl/api/history/create'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );

    return response;
  }

  Future<dynamic> getMe() async {
    var response = await client.get(Uri.parse('$baseUrl/api/history/getMe'));

    return response;
  }

  Future<dynamic> get() async {
    var response =
        await client.get(Uri.parse('$remoteUrl?populate=images,tags'));

    return response;
  }

  Future<dynamic> getByName({required String keyword}) async {
    var response = await client.get(Uri.parse(
        '$remoteUrl?populate=product.images,product.tags&filters[email][\$contains]=sample@gmail.com'));

    return response;
  }

  Future<dynamic> addToHistory({required product, required email}) async {
    var body = {"product": product, "email": email};
    var response = await client.post(
      Uri.parse('$baseUrl/api/history/create'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );

    return response;
  }

  Future<dynamic> deleteManyHistory({required email}) async {
    var body = {"email": email};
    var response = await client.post(
      Uri.parse('$baseUrl/api/history/deleteMany'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );

    return response;
  }

  Future<dynamic> getByCategory({required int id}) async {
    var response = await http.get(
        Uri.parse('$remoteUrl?populate=images,tags&filters[category][id]=$id'));

    return response;
  }
}
