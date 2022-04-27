import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_api_study/view_models/base_view_model.dart';
import '../model/album_model.dart';


class ScoreViewModel extends BaseViewModel {
  Album? album;

  @override
  Future<void> initModel() async {
    await Future.delayed(Duration(seconds: 4));
    busy = false;
  }

  Future<void> testPost() async {
    try {
      busy = true;
      album = await handleResponse();
      await Future.delayed(Duration(seconds: 3));
      busy = false;
    } catch (e) {
      print(e.toString());
    }
  }

  Future<Album> handleResponse() async {
    http.Response response = await createAlbum('ini judul test2');

    if (response.statusCode == 201) {
      return Album.fromJson(json.decode(response.body));
    } else {
      throw Exception('failed to load album');
    }
  }

  Future<http.Response> createAlbum(String title) async {
    String url = 'https://jsonplaceholder.typicode.com/albums';
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };

    Map<String, dynamic> body = {'title': title};

    return http.post(Uri.parse(url), headers: headers, body: jsonEncode(body));
  }
}

