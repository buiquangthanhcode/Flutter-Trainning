import 'package:flutter/material.dart';
import 'package:flutter_swipe/flutter_swipe.dart';
import 'package:provider/provider.dart';
import 'package:week03/providers/item_provider.dart';

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
                value: fillterOptions.all,
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

class SwipeBody extends StatefulWidget {
  SwipeBody({Key? key, required this.isFavorite}) : super(key: key);

  var isFavorite;

  @override
  State<SwipeBody> createState() => _SwipeBodyState();
}

class _SwipeBodyState extends State<SwipeBody> {
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ItemProvide>(context, listen: false).readJson();
  }

  @override
  Widget build(BuildContext context) {
    final items = widget.isFavorite
        ? Provider.of<ItemProvide>(context).itemsFavorites()
        : Provider.of<ItemProvide>(context).getItems();
    print("123");
    return Swiper(
      layout: SwiperLayout.STACK,
      itemWidth: 350.0,
      itemHeight: 650.0,
      itemCount: items.length,
      itemBuilder: (BuildContext context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: GridTile(
            footer: GridTileBar(
              backgroundColor: Colors.white12,
              title: Consumer<ItemProvide>(
                builder: (context, value, child) {
                  return InkWell(
                    onTap: (() {
                      value.isToggleItem(index);
                    }),
                    child: Icon(
                      Icons.favorite,
                      size: 30,
                      color: value.getItems()[index].isFavorite
                          ? Colors.red
                          : Colors.white,
                    ),
                  );
                  ;
                },
              ),
              subtitle: const Text('Like Image'),
              trailing: Text(
                items[index].name,
                style: const TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
            child: Image.asset(
              items[index].image,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
