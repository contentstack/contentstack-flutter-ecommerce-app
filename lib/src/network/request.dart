/// Checks if you are awesome. Spoiler: you are.
import 'dart:convert';
import 'package:ecommerce/src/model/entrymodel.dart';
import 'package:http/http.dart' as http;

class Network {
  Future<T> getRequest<T, K>() async {

    const url = 'https://cdn.contentstack.io/v3/content_types/ecommerce_app_android/entries?environment=mobile';
    var response = await http.get(url, headers: {
      'api_key': 'blt02532e5510d39dec',
      'access_token': 'cs253acbe45719247760e342eb'
    });
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      Map bodyJson = jsonDecode(response.body);
      if (bodyJson.containsKey('entries')) {
        return fromJson<T, K>(bodyJson['entries']);
      } else if (bodyJson.containsKey('entry') && T == EntryModel) {
        return fromJson<T, K>(bodyJson['entry']);
      }else {
        return fromJson<T, K>(bodyJson);
      }
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  static T fromJson<T, K>(dynamic json) {
    if (json is Iterable) {
      return _fromJsonList<K>(json) as T;
    } else if (T == EntryModel) {
      return EntryModel.fromJson(json) as T;
    } else if (T == EntryModel) {
      return EntryModel.fromJson(json) as T;
    } else if (T == EntryModel) {
      return EntryModel.fromJson(json) as T;
    } else {
      return json;
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
