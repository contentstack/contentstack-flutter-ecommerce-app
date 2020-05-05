import 'dart:convert';
import 'package:ecommerce/src/model/entrymodel.dart';
import 'package:http/http.dart' as http;

class Network {

  Future<T> getRequest<T, K>() async {
    const url = 'https://cdn.contentstack.io/v3/content_types/ecommerce_app_android/entries?environment=mobile';
    var response = await http.get(url, headers: {
      'api_key': '***REMOVED***',
      'access_token': '***REMOVED***'
    });
    if (response.statusCode == 200) {
      Map bodyJson = jsonDecode(response.body);
      if (bodyJson.containsKey('entries')) {
        return fromJson<T, K>(bodyJson['entries']);
      }
    } else {
      throw Exception('Failed to load post');
    }
    return null;
  }

  static T fromJson<T, K>(dynamic json) {
    if (json is Iterable) {
      return _fromJsonList<K>(json) as T;
    } else if (T == EntryModel) {
      return EntryModel.fromJson(json) as T;
    }
  }

  static List<K> _fromJsonList<K>(List jsonList) {
    if (jsonList == null) {
      return null;
    }
    var output = <K>[];
    for (Map<String, dynamic> json in jsonList) {
      output.add(fromJson(json));
    }
    return output;
  }
}
