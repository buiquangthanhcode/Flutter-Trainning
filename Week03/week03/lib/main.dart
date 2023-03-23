import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'modal/item_model.dart';
import 'providers/item_provider.dart';
import 'widget/swiper_widget.dart';

void main(List<String> args) {
  runApp(ChangeNotifierProvider(
    create: (_) => ItemProvide(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final List<Item> Items = [
    Item(
      id: '1',
      name: 'Corporate Program Designer',
      image: 'assets/images/img3.jpeg',
    ),
    Item(
      id: '2',
      name: 'International Group Designer',
      image: 'assets/images/img4.jpeg',
    ),
    Item(
      id: '1',
      name: 'Future Operations Technician',
      image: 'assets/images/img5.jpeg',
    )
  ];

  @override
  Widget build(BuildContext context) {
    Provider.of<ItemProvide>(context).readJson();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Favorite Images'),
          // leading: Padding(
          //     padding: EdgeInsets.all(12),
          //     child: Badge(
          //       label: Text(Provider.of<ItemProvide>(context, listen: false)
          //           .far
          //           .toString()),
          //       child: const Icon(Icons.favorite),
          //     )),
          actions: [
            PopupMenuButton(
              icon: const Icon(Icons.more_vert),
              itemBuilder: (_) => [
                const PopupMenuItem(
                  child: Text('Show All'),
                ),
                const PopupMenuItem(
                  child: Text('Favorite'),
                ),
              ],
            ),
          ],
        ),
        body: SwipeBody(
          items: Items,
        ));
  }
}
