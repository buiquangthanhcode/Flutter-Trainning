import 'package:flutter/material.dart';

class ModalButton extends StatelessWidget {
  ModalButton({super.key, required this.addTasks});
  final Function addTasks;
  TextEditingController _controller = TextEditingController();

  void _handleOnClick(BuildContext context) {
    final name = _controller.text;
    if (name.isEmpty || name.length < 5) {
      return;
    } else
      addTasks(name);
    Navigator.pop(context);
  }

  void _handleDelete() {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
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
                  child: const Text("Add Text")),
            ),
          ],
        ),
      ),
    );
  }
}
