import 'dart:convert';
import 'dart:developer';

import 'package:chuck_norris_app/const/app_res.dart';
import 'package:dio/dio.dart';

class Api {
  static final Dio _dio = Dio();

  static void _printDebug(String reqUrl, Response res) {
    log("------ Request ------");
    log(reqUrl);
    log("------ Response ------");
    log(res.toString());
    log("------ End ------");
  }

  static Future<String> getRandomJoke({String? category}) async {
    final String appendix = (category != null ? "?category=" + category : "");
    final String requestUrl = "${AppRes.apiBaseUrl}/jokes/random" + appendix;
    final Response response = await _dio.get(requestUrl);
    final String joke = response.data['value'];
    _printDebug(requestUrl, response);
    return joke;
  }

  static Future<List<String>> getCategories() async {
    const String requestUrl = "${AppRes.apiBaseUrl}/jokes/categories";
    final Response response = await _dio.get(requestUrl);
    final List<dynamic> categoriesRaw = response.data;
    List<String> categories = categoriesRaw.map((x) => "$x").toList();
    _printDebug(requestUrl, response);
    return categories;
  }

  static Future<List<String>> search(String query) async {
    final String requestUrl = "${AppRes.apiBaseUrl}/jokes/search?query=${query}";
    final Response response = await _dio.get(requestUrl);
    final List<dynamic> resultsRaw = response.data['result'];
    List<String> results = resultsRaw.map((x) => "${x['value']}").toList();
    _printDebug(requestUrl, response);
    return results;
  }
}