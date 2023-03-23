import 'package:flutter/material.dart';
import 'package:todo_list/modal/items.dart';

import 'widget/card_body.dart';
import 'widget/card_modal_button.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<DataItems> items = [
    DataItems(id: "1", name: "Tap The Duc",time:"8AM-10AM", colors:"pink"),
    DataItems(id: "2", name: "An trua", time: "10AM-11AM", colors: "orange"),
    DataItems(id: "3", name: "An toi", time: "12PM-13PM", colors: "blue"),
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          Container(
            width: 150,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: MaterialButton(
              color: Color.fromRGBO(255, 198, 171, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return ModalButton(addTasks: addTasks);
                    });
              },
              child: Text(
                "Add Task",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Dancing_Script",
                    fontSize: 25),
              ),
            ),
          )
        ],
        title: const Text("ToDoList App",
            style: TextStyle(
                fontSize: 30,
                fontFamily: "Dancing_Script",
                color: Colors.black)),
        backgroundColor: Colors.white,
        centerTitle: false,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Daily Task",
              style: TextStyle(fontFamily: "Dancing_Script", fontSize: 25),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                top: 25.0,
              ),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: Color.fromRGBO(251, 239, 229, 1),
              ),
              child: SingleChildScrollView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: items
                        .map((item) => CardBody(
                              item: item,
                              deleteTask: deleteTasks,
                              index: items.indexOf(item),
                            ))
                        .toList(),
                  )),
            ),
          ),
        ]),
      ),
    );
  }

  void addTasks(String name,String time,String color) {
    final newTask = DataItems(id: DateTime.now().toString(), name: name,time: time, colors: color);
    setState(() {
      items.add(newTask);
    });
  }

  void deleteTasks(String id) {
    setState(() {
      items.removeWhere((item) => item.id == id);
    });
  }
}
