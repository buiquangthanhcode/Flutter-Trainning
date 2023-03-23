import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';

class CardBody extends StatelessWidget {
  var item;
  CardBody({
    super.key,
    required this.item,
    required this.deleteTask,
    required this.index,
  });
  final Function deleteTask;
  var index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 150,
          margin: const EdgeInsets.only(bottom: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: RotatedBox(
                        quarterTurns: 3,
                        child: () {
                          if (item.colors == "pink") {
                            return const Text(
                              "Meeting",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Dancing_Script",
                                  fontSize: 20),
                            );
                          } else if (item.colors == "organe") {
                            return const Text(
                              "Play",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Dancing_Script",
                                  fontSize: 20),
                            );
                          } else {
                            return const Text(
                              "Eating",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Dancing_Script",
                                  fontSize: 20),
                            );
                          }
                        }()),
                  ),
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              Flexible(
                flex: 7,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.limeAccent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            )),
                      ),
                    ),
                    Flexible(
                      flex: 8,
                      child: Container(
                        decoration: BoxDecoration(color: Colors.pink.shade50),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.name,
                                style: const TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontFamily: "Dancing_Script",
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                item.time,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.redAccent,
                                  fontFamily: "Dancing_Script",
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Expanded(
                                child: Text(
                                  "Consequuntur excepturi quia neque ut doloribus sit ea. Asperiores eveniet dolores rerum. Id ut et dolorem culpa incidunt a voluptatibus explicabo.",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 25.0,
          right: -5.0,
          child: Row(
            children: [
              Container(
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.all(2),
                child: Icon(
                  Icons.badge_sharp,
                  color: Colors.orange,
                  size: 30,
                ),
              ),
              Container(
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.all(2),
                child: Icon(
                  Icons.alarm,
                  color: Colors.yellow,
                  size: 30,
                ),
              ),
              Container(
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.all(2),
                child: Icon(
                  Icons.note,
                  color: Colors.green,
                  size: 30,
                ),
              ),
              InkWell(
                onTap: () async {
                  if (await confirm(context)) {
                    deleteTask(item.id);
                  }
                  return;
                },
                child: Container(
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.all(2),
                  child: Icon(
                    Icons.delete,
                    color: Colors.blue,
                    size: 30,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
