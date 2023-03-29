import 'package:flutter/material.dart';
import 'package:flutter_swipe/flutter_swipe.dart';
import 'package:provider/provider.dart';
import 'package:week03/providers/item_provider.dart';

import '../modal/item_model.dart';

class SwipeBody extends StatefulWidget {
  const SwipeBody({Key? key, required this.items}) : super(key: key);

  final items;

  @override
  State<SwipeBody> createState() => _SwipeBodyState();
}

class _SwipeBodyState extends State<SwipeBody> {


  @override
  Widget build(BuildContext context) {
    return Swiper(
      layout: SwiperLayout.STACK,
      itemWidth: 350.0,
      itemHeight: 650.0,
      itemCount: widget.items.length,
      itemBuilder: (BuildContext context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Consumer<ItemProvide>(
            builder: (context, value, child) {
              return GridTile(
                footer: GridTileBar(
                  backgroundColor: Colors.white12,
                  title: InkWell(
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
                  ),
                  subtitle: const Text('Like Image'),
                  trailing: Text(
                    value.getItems()[index].name,
                    style: const TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
                child: Image.asset(
                  value.getItems()[index].image,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
