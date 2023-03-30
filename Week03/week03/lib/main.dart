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

enum fillterOptions { all, favorites }

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isFavorite = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Provider.of<ItemProvide>(context, listen: false).readJson();
  }

  @override
  Widget build(BuildContext context) {
    print("building");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Images'),
        leading: Padding(
          padding: const EdgeInsets.all(12),
          child: Consumer<ItemProvide>(
            builder: (context, value, child) {
              return Badge(
                label: Text(value.getAllItemFavorite().toString()),
                child: const Icon(Icons.favorite),
              );
            },
          ),
        ),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              setState(() {
                if (value == fillterOptions.all) {
                  isFavorite = false;
                } else {
                  isFavorite = true;
                }
              });
            },
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: fillterOptions.all,
                child: Text('Show All'),
              ),
              const PopupMenuItem(
                value: fillterOptions.favorites,
                child: Text('Favorite'),
              ),
            ],
          ),
        ],
      ),
      body: SwipeBody(
        isFavorite: isFavorite,
      ),
    );
  }
}
