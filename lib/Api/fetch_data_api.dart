import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter_api_study/Api/fetch_model.dart';

import 'package:http/http.dart' as http;

class FetchDataViewModel extends ChangeNotifier {
  TesModel? tesModel;

  Future<void> fectData() async {
    tesModel = null;

    notifyListeners();

    String api = 'https://jsonplaceholder.typicode.com/todos/1';

    http.Response response = await http.get(Uri.parse(api));
    try {
      if (response.statusCode == 200) {
        tesModel = TesModel.fromJson(jsonDecode(response.body));
        notifyListeners();
      }
    } catch (e) {
      print('error');
    }
  }
}

class FectDataViewModelPost extends ChangeNotifier {
  TesModel? tesModel;

  Future<void> fectDataPost() async {
    tesModel = null;

    notifyListeners();

    String api = 'https://jsonplaceholder.typicode.com/todos/1';

    http.Response response = await http.post(Uri.parse(api));
    try {
      if (response.statusCode == 200) {
        tesModel = TesModel.fromJson(jsonDecode(response.body));
        notifyListeners();
      }
    } catch (e) {
      print('error');
    }
  }
}
