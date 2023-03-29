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

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ItemProvide>(context, listen: false).readJson();
  }

  @override
  Widget build(BuildContext context) {
    print("build");

    return Scaffold(
        appBar: AppBar(
          title: const Text('Favorite Images'),
          leading: Padding(
            padding: const EdgeInsets.all(12),
            child: Consumer<ItemProvide>(
              builder: (context, value, child) {
                return Badge(
                  label: Text(Provider.of<ItemProvide>(context, listen: false)
                      .getAllItemFavorite()
                      .toString()),
                  child: const Icon(Icons.favorite),
                );
              },
            ),
          ),
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
          items: Provider.of<ItemProvide>(context).getItems(),
        ));
  }
}
