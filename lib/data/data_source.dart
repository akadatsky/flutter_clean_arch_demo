import 'dart:async';
import 'dart:convert';

import 'package:giphy_sample/api/api_response.dart';
import 'package:giphy_sample/const.dart';
import 'package:http/http.dart' as http;

class DataSource {
  Future<List<Data>> getData(String request) async {
    var queryParams = {
      'api_key': giphyApiKey,
      'q': request,
    };
    var uri = Uri.https(giphyAuthority, giphyPath, queryParams);
    final client = http.Client();
    final response = await client.get(uri);
    if (response.statusCode == 200) {
      ApiResponse apiResponse = ApiResponse.fromJson(jsonDecode(response.body));
      return apiResponse.data ?? [];
    }
    return [];
  }
}
