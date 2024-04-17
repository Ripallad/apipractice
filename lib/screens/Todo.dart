import 'package:apipractice/controller/TodoController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Todo extends StatelessWidget {
  const Todo({super.key});

  @override
  Widget build(BuildContext context) {
    final todocontroller = TodoController()..Todoapi();
    return SafeArea(
      child: Obx(
        () => todocontroller.obxcheck.value
            ? Scaffold()
            : Scaffold(
                appBar: AppBar(
                  title: Text(
                    "Todolist",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
                body: todocontroller.apitdata.value.isEmpty
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
                                itemCount: todocontroller.apitdata.length,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Container(
                                      height: 100,
                                      width: 350,
                                      decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                              121, 147, 176, 114),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: ListTile(
                                        title: Text(todocontroller
                                            .apitdata[index].title),
                                        subtitle: Text("hcgfxxgf"),
                                        trailing: Container(
                                          height: 30,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 182, 49, 235),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Center(
                                              child: Text(
                                            'Complited',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )),
                                        ),
                                      ),
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
