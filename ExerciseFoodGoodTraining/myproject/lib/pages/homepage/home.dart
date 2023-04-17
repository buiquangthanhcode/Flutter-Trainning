import 'package:flutter/material.dart';
import 'package:myproject/app/routes/router_name.dart';
import 'package:myproject/providers/category_provider.dart';
import 'package:provider/provider.dart';

import '../../config/const.dart';
import '../../providers/product_provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    print("Category");

    return Scaffold(
      appBar: AppBar(
        title: const Text("Category"),
        backgroundColor: dColorMain,
      ),
      body: FutureBuilder(
          future: Provider.of<CategoryProvider>(context).readJson(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting ||
                !snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return GridView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AppRouterName.productPage,
                          arguments: {
                            "title": snapshot.data[index].name,
                            "categoryId": snapshot.data[index].id,
                          });
                    },
                    child: Column(
                      children: [
                        Expanded(
                            flex: 2,
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(snapshot.data[index].image),
                                ),
                              ),
                            )),
                        Expanded(
                            flex: 1,
                            child: Center(
                              child: Text(
                                snapshot.data[index].name.toString(),
                                style: styleTitleItem,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                              ),
                            ))
                      ],
                    ),
                  );
                },
              );
            }
          }),
    );
  }
}
