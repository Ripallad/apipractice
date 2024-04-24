import 'package:apipractice/controller/AlbumsController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Albums extends StatelessWidget {
  const Albums({super.key});

  @override
  Widget build(BuildContext context) {
    final albumcontroller = AlbumController()..albumapi();
    return SafeArea(
      child: Obx(
        () => Scaffold(
          appBar: AppBar(
            title: Text(
              "Album",
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
          body: albumcontroller.apiadata.value.isEmpty
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                              prefixIconColor: Color(0xff787474),
                              contentPadding: EdgeInsets.only(
                                  top: 13, bottom: 13, left: 20),
                              suffixIcon: Icon(Icons.search_rounded),
                              hintText: "Search",
                              hintStyle: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                              fillColor: Color(0x30CCCCCC),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                    color: Color(0x30CCCCCC), width: 3),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                    color: Color(0x30CCCCCC), width: 3),
                              )),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ListView.builder(
                          itemCount: albumcontroller.apiadata.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                height: 100,
                                width: 350,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(121, 147, 176, 114),
                                    borderRadius: BorderRadius.circular(20)),
                                child: ListTile(
                                    leading: Text(albumcontroller
                                        .apiadata[index].id
                                        .toString()),
                                    title: Text(
                                        albumcontroller.apiadata[index].title),
                                    trailing: Text(albumcontroller
                                        .apiadata[index].userId
                                        .toString())),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
