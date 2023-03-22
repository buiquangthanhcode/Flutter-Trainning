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
    DataItems(id: "1", name: "Tap The Duc"),
    DataItems(id: "2", name: "An trua"),
    DataItems(id: "3", name: "An toi"),
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                items.length.toString(),
              ))
        ],
        title: const Text("ToDoList", style: TextStyle(fontSize: 30)),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
      floatingActionButton: FloatingActionButton(
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
          child: const Icon(
            Icons.add,
            size: 40,
          )),
    );
  }

  void addTasks(String name) {
    final newTask = DataItems(id: DateTime.now().toString(), name: name);
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
