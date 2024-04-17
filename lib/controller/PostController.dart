import 'dart:convert';

import 'package:apipractice/models/PostModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PostController extends GetMaterialApp {
  RxList apipost = [].obs;
  postapi() async {
    var url = 'https://jsonplaceholder.typicode.com/posts';
    var response = await http.get(Uri.parse(url));
    var data = jsonDecode(response.body);
    var list = data.map((p) => PostModel.fromMap(p)).toList();
    apipost.clear();
    apipost.addAll(list);
    print(apipost);
  }
}
