import 'dart:convert';

import 'package:apipractice/models/TodoModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TodoController extends GetMaterialApp {
  RxList apitdata = [].obs;
  RxBool obxcheck = false.obs;
  Todoapi() async {
    var url = "https://jsonplaceholder.typicode.com/todos";
    var response = await http.get(Uri.parse(url));
    var data = jsonDecode(response.body);
    var list = data.map((t) => TodoModel.fromMap(t)).toList();
    apitdata.clear();
    apitdata.addAll(list);
    print(apitdata);
  }
}
