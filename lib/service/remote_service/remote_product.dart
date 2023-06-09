import 'package:http/http.dart' as http;
import 'package:my_app/const.dart';

class RemoteProductService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/products';

  Future<dynamic> getCart() async {
    var response = await client.get(Uri.parse(
        'http://192.168.1.14:1337/api/carts?populate=product&filters[email][\$contains]=sample@gmail.com'));

    return response;
  }

  Future<dynamic> get() async {
    var response =
        await client.get(Uri.parse('$remoteUrl?populate=images,tags'));

    return response;
  }

  Future<dynamic> getByName({required String keyword}) async {
    var response = await client.get(Uri.parse(
        '$remoteUrl?populate=images,tags&filters[name][\$contains]=$keyword'));

    return response;
  }

  Future<dynamic> getByCategory({required int id}) async {
    var response = await client.get(
        Uri.parse('$remoteUrl?populate=images,tags&filters[category][id]=$id'));

    return response;
  }
}
