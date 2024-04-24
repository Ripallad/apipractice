import 'dart:convert';

import 'package:apipractice/models/AlbumsModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AlbumController extends GetxController {
  RxList apiadata = [].obs;
  albumapi() async {
    var url = "https://jsonplaceholder.typicode.com/albums";
    var response = await http.get(Uri.parse(url));
    var data = jsonDecode(response.body);
    var list = data.map((a) => AlbumModel.fromMap(a)).toList();
    apiadata.clear();
    apiadata.addAll(list);
    print(apiadata);
  }
}
