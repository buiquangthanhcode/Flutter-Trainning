import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week06/provider/category_provider.dart';
import 'dart:math' as math;

class CategoryPage extends StatefulWidget {
  static const routerName = '/category';

  CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Provider.of<CategoryProvider>(context, listen: false).selectedChoose = [];
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<CategoryProvider>(context).getRequest(
          "http://apiforlearning.zendvn.com/api/categories_news?offset=0&limit=10&sort_by=id&sort_dir=asc"),
      builder: (context, snapshot) {
        return Scaffold(
          body: snapshot.hasData
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Flexible(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 25),
                            child: Text(
                              "Reccomend for you",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: CustomScrollView(
                            slivers: [
                              SliverGrid(
                                delegate: SliverChildBuilderDelegate(
                                  (context, index) {
                                    bool isSelected =
                                        Provider.of<CategoryProvider>(context)
                                            .selectedChoose
                                            .contains(snapshot.data![index].id);
                                    return StatefulBuilder(
                                      builder: (context, setStateChange) {
                                        return ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Stack(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Color((math.Random()
                                                                  .nextDouble() *
                                                              0xFFFFFF)
                                                          .toInt())
                                                      .withOpacity(1.0),
                                                ),
                                              ),
                                              Center(
                                                child: Text(
                                                  snapshot.data![index].name
                                                      .toString(),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Container(
                                                decoration: const BoxDecoration(
                                                    color: Colors.transparent),
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5,
                                                        vertical: 5),
                                                alignment:
                                                    Alignment.bottomRight,
                                                child: Checkbox(
                                                  shape: const CircleBorder(),
                                                  tristate: true,
                                                  activeColor: isSelected
                                                      ? const Color(0xff06bbfb)
                                                      : Colors.transparent,
                                                  onChanged: (bool? value) {
                                                    setStateChange(() {
                                                      isSelected = !isSelected;
                                                      Provider.of<CategoryProvider>(
                                                              context,
                                                              listen: false)
                                                          .listenCategorySelected(
                                                              snapshot
                                                                  .data![index]
                                                                  .id);
                                                    });
                                                    print(Provider.of<
                                                                CategoryProvider>(
                                                            context,
                                                            listen: false)
                                                        .selectedChoose);
                                                  },
                                                  value: isSelected,
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  childCount: snapshot.data!.length,
                                ),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 15,
                                  mainAxisSpacing: 15,
                                  childAspectRatio: 2 / 1.3,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                )
              : Center(child: const CircularProgressIndicator()),
        );
      },
    );
  }
}
