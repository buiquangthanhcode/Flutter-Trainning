import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ModalButton extends StatelessWidget {
  ModalButton({super.key, required this.addTasks});
  final Function addTasks;
  TextEditingController _controller = TextEditingController();
  TextEditingController _controller_time = TextEditingController();
  void _handleOnClick(BuildContext context) {
    final name = _controller.text;
    final time = _controller_time.text;
    if (name.isEmpty || name.length < 5) {
      return;
    } else {
      addTasks(name, time, "blue");
    }
    Navigator.pop(context);
  }

  void _handleDelete() {}

  @override
  Widget build(BuildContext context) {
    // create some values

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              const Text(
                "Color",
                style: TextStyle(fontFamily: "Dancing_Script", fontSize: 25),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(
                    color: Color.fromRGBO(255, 150, 183, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Pink",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Dancing_Script",
                          fontSize: 20),
                    ),
                  ),
                  MaterialButton(
                    color: Color.fromRGBO(255, 200, 85, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Organe",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Dancing_Script",
                          fontSize: 20),
                    ),
                  ),
                  MaterialButton(
                    color: Color.fromRGBO(139, 255, 235, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Blue",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Dancing_Script",
                          fontSize: 20),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: _controller_time,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Time",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Your task",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      _handleOnClick(context);
                    },
                    child: const Text(
                      "Add Text",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Dancing_Script",
                          fontSize: 20),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
