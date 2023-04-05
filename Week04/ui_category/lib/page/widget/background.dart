import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_category/category_provider/category_provider.dart';

import '../../modal/category.dart';

class BackGround extends StatefulWidget {
  BackGround({super.key});

  @override
  State<BackGround> createState() => _BackGroundState();
}

class _BackGroundState extends State<BackGround> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: FutureBuilder<List<Category>>(
          future:
              Provider.of<CategoryProvider>(context, listen: false).readJson(),
          builder: (context, snapshot) {
            Provider.of<CategoryProvider>(context, listen: false).categories =
                snapshot.data as List<Category>;
            List<Category> category =
                Provider.of<CategoryProvider>(context, listen: false)
                    .categories;
            return Image.network(
              category[Provider.of<CategoryProvider>(context, listen: false)
                      .current]
                  .image,
              fit: BoxFit.cover,
            );
          }),
    );
  }
}
