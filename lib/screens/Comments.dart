import 'package:apipractice/controller/CommentController.dart';
import 'package:apipractice/controller/TodoController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Comments extends StatelessWidget {
  const Comments({super.key});

  @override
  Widget build(BuildContext context) {
    final texteditingcontroller = TextEditingController();
    final ccontroller = Get.put(CommentController())..commentapi();
    return Obx(
      () => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Comments"),
          ),
          body: ccontroller.apidata.value.isEmpty
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFormField(
                          onChanged: (Text) {
                            ccontroller.SearchData(Text);
                          },
                          controller: texteditingcontroller,
                          decoration: InputDecoration(
                              prefixIconColor: Color(0xff787474),
                              contentPadding: EdgeInsets.only(
                                  top: 13, bottom: 13, left: 20),
                              suffixIcon: Icon(Icons.search_rounded),
                              hintText: 'Search',
                              hintStyle: TextStyle(color: Color(0xff787474)),
                              fillColor: Color(0x30cccccc),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13),
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13),
                                borderSide: BorderSide(color: Colors.black),
                              )),
                        ),
                        ccontroller.searchlist.value.isNotEmpty
                            ? ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: ccontroller.searchlist.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                      height: 60,
                                      width: 390,
                                      decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 158, 153, 248),
                                          borderRadius:
                                              BorderRadius.circular(13)),
                                      child: ListTile(
                                        leading: Text(
                                          ccontroller.searchlist[index].id
                                              .toString(),
                                        ),
                                        title: Text(
                                            ccontroller.searchlist[index].name),
                                      ),
                                    ),
                                  );
                                },
                              )
                            : ListView.builder(
                                itemCount: ccontroller.apidata.length,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Container(
                                      height: 90,
                                      width: 390,
                                      decoration: BoxDecoration(
                                          color: Colors.blueAccent,
                                          borderRadius:
                                              BorderRadius.circular(13)),
                                      child: ListTile(
                                        title: Text(
                                            ccontroller.apidata[index].name),
                                        subtitle: Text(
                                            ccontroller.apidata[index].email),
                                        trailing: Text(ccontroller
                                            .apidata[index].id
                                            .toString()),
                                      ),
                                    ),
                                  );
                                },
                              ),
                        // Container(
                        //   height: 70,
                        //   width: 390,
                        //   decoration: BoxDecoration(
                        //       color: Colors.blueAccent,
                        //       borderRadius: BorderRadius.circular(13)),
                        //   child: ListTile(
                        //     title: Text("Abc"),
                        //     subtitle: Text("Sub Abc"),
                        //     trailing: Text("id"),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
