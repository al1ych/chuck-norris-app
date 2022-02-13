import 'dart:convert';
import 'dart:developer';

import 'package:chuck_norris_app/const/app_res.dart';
import 'package:dio/dio.dart';

class Api {
  static final Dio _dio = Dio();

  static Future<String> getRandomJoke() async {
    const String requestUrl = "${AppRes.apiBaseUrl}/jokes/random";
    final Response response = await _dio.get(requestUrl);
    final String joke = response.data['value'];
    log("------ Request ------");
    log(requestUrl);
    log("------ Response ------");
    log(response.toString());
    return joke;
  }

  static Future<List<dynamic>> getCategories() async {
    const String requestUrl = "${AppRes.apiBaseUrl}/jokes/categories";
    final Response response = await _dio.get(requestUrl);
    final List<dynamic> categoriesRaw = response.data;
    List<String> categories = categoriesRaw.map((x) => "$x").toList();
    log("------ Request ------");
    log(requestUrl);
    log("------ Response ------");
    log(response.toString());
    return categories;
  }
}
