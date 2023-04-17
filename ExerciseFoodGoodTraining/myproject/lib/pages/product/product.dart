import 'package:flutter/material.dart';
import 'package:myproject/app/routes/router_name.dart';
import 'package:provider/provider.dart';

import '../../config/const.dart';
import '../../models/product_model.dart';
import '../../providers/product_provider.dart';

class ProductPage extends StatefulWidget {
  ProductPage({super.key, required this.categoryID});
  var categoryID;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    var products = Provider.of<ProductProvider>(context)
        .getItemsWithCategoryId(widget.categoryID);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: dColorMain,
        title: const Text(
          "Products",
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(15),
        itemCount: products.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 20);
        },
        itemBuilder: (BuildContext context, int index) {
          return ChangeNotifierProvider<Product>.value(
            value: products[index],
            builder: (context, child) {
              return Consumer<Product>(
                builder: (context, value, child) {
                  return InkWell(
                    onTap: (() {
                      Navigator.pushNamed(
                          context, AppRouterName.productDetailPage,
                          arguments: {"id": products[index].id});
                      value.toggleIsSeen();
                    }),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12)),
                      width: double.infinity,
                      height: 220,
                      child: GridTile(
                        footer: GridTileBar(
                          backgroundColor: dColorFooterImage,
                          title: Text(
                            products[index].title,
                            style: styleTitleItem,
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  InkWell(
                                    onTap: (() {
                                      value.toggleIsFavorite();
                                    }),
                                    child: Icon(
                                      Icons.favorite,
                                      size: sizeIconButtonTitle,
                                      color: value.isFavorite
                                          ? dColorIconButtonActive
                                          : dColorIconButtonInactive,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    value.favorite,
                                    style: styleTitleIcon,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Icon(
                                Icons.timelapse_sharp,
                                size: sizeIconButtonTitle,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                value.view,
                                style: styleTitleIcon,
                              ),
                            ],
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            products[index].image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
