import 'dart:convert';

import 'package:apipractice/models/CommentModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CommentController extends GetMaterialApp {
  RxList apidata = [].obs;
  RxList searchlist = [].obs;
  commentapi() async {
    var url = "https://jsonplaceholder.typicode.com/comments";
    var response = await http.get(Uri.parse(url));
    var data = jsonDecode(response.body);
    var list = data.map((c) => CommentModel.fromMap(c));
    apidata.clear();
    apidata.addAll(list);
    print(apidata);
  }

  SearchData(Text) {
    searchlist.value = [];
    if (Text.isEmpty) {
      searchlist.value = [];
    } else {
      searchlist.value = apidata.value
          .where((element) => element.name
              .toString()
              .toLowerCase()
              .contains(Text.toLowerCase()))
          .toList();
    }
  }
}
