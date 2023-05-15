import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_app/const.dart';

class RemoteOrderService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/orders';
  var remoteUrlCart = '$baseUrl/api/carts';

  Future<dynamic> getOrder({required email}) async {
    var response = await client.get(Uri.parse(
        '$remoteUrlCart?populate=product.images,product.tags&filters[email][\$contains]=$email'));

    return response;
  }

  Future<dynamic> addOrder({required email}) async {
    var body = {"email": email};
    var response = await client.post(
      Uri.parse('$baseUrl/api/order/create'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );

    return response;
  }

  Future<dynamic> getMe() async {
    var response = await client.get(Uri.parse('$baseUrl/api/order/getMe'));

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

  Future<dynamic> addToOrder({required product, required email}) async {
    var body = {"product": product, "email": email};
    var response = await client.post(
      Uri.parse('$baseUrl/api/order/create'),
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
