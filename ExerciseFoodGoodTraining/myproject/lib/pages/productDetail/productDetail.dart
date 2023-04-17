import 'package:flutter/material.dart';
import 'package:myproject/models/product_model.dart';
import 'package:provider/provider.dart';

import '../../config/const.dart';
import '../../providers/product_provider.dart';

class ProductDetail extends StatefulWidget {
  var id;
  var product;
  ProductDetail({super.key, required this.id});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    var product = Provider.of<ProductProvider>(context, listen: false)
        .getItemWithId(widget.id);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(product.image),
                ),
              ),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Positioned(
                    top: 50,
                    left: 10,
                    child: BackButton(
                      color: Colors.amber,
                      onPressed: () {
                        return Navigator.of(context).pop();
                      },
                    ),
                  ),
                  ChangeNotifierProvider<Product>.value(
                    value: product,
                    child: Consumer<Product>(
                      builder: (context, value, child) {
                    
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              width: 120,
                              height: 50,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(12),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: (() {
                                      value.toggleIsFavorite();
                                    }),
                                    child: Icon(
                                      Icons.favorite,
                                      color: value.isFavorite
                                          ? dColorIconButtonActive
                                          : dColorIconButtonInactive,
                                      size: sizeIconButtonTitle,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    value.favorite,
                                    style: styleTitleIcon,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 120,
                              height: 50,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.timelapse_sharp,
                                    color: dColorIconButtonInactive,
                                    size: sizeIconButtonTitle,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    value.view,
                                    style: styleTitleIcon,
                                  ),
                                ],
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                      'assets/images/background/background_product.png'),
                ),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(product.intro),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Container(
                          width: 167,
                          height: 35,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                            color: dColorProduct,
                          ),
                          child: const Center(
                              child: Text(
                            'Nguyên Liệu',
                            style: styleTitleItem,
                          )),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: dColorProduct,
                              borderRadius: BorderRadius.circular(2)),
                          child: Text(product.ingredients),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Container(
                          width: 167,
                          height: 35,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                            color: dColorProduct,
                          ),
                          child: const Center(
                              child: Text(
                            'Cách thực hiện',
                            style: styleTitleItem,
                          )),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: dColorProduct,
                              borderRadius: BorderRadius.circular(2)),
                          child: Text(product.instructions),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
