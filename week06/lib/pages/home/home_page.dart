import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week06/app/themes/theme.dart';
import 'package:week06/models/articles.dart';
import 'package:week06/pages/category/category_page.dart';
import 'package:week06/provider/articles_provider.dart';
import 'package:week06/provider/category_provider.dart';

class HomePage extends StatefulWidget {
  static const routerName = '/';
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, List<Articles>> articleByCategoryId = {};

  var id;

  var nameOfIDCategory;

  var selectedChoose;

  @override
  Widget build(BuildContext context) {
    Future<Map<String, List<Articles>>> getDataByIDCategory(
        List<int> id) async {
      for (var item in id) {
        List<Articles> data = await Provider.of<ArticleProvider>(context,
                listen: false)
            .getRequest(
                "http://apiforlearning.zendvn.com/api/categories_news/$item/articles?offset=0&limit=10&sort_by=id&sort_dir=desc");
        articleByCategoryId[item.toString()] = data;
      }
      return articleByCategoryId;
    }

    Provider.of<CategoryProvider>(context).getRequest(
        "http://apiforlearning.zendvn.com/api/categories_news?offset=0&limit=10&sort_by=id&sort_dir=asc");
    print(Provider.of<CategoryProvider>(context).result);
    selectedChoose = Provider.of<CategoryProvider>(context).selectedChoose;
    id = (selectedChoose.isNotEmpty) ? selectedChoose : [1, 2, 3];
    nameOfIDCategory =
        Provider.of<CategoryProvider>(context).getNameOfIdCatfory(id);
    return Scaffold(
      body: FutureBuilder(
        future: getDataByIDCategory(id),
        builder: (context, snapshot) {
          final status = snapshot.hasData;
          if (snapshot.connectionState == ConnectionState.done &&
              nameOfIDCategory.isNotEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: IconButton(
                        alignment: Alignment.centerLeft,
                        onPressed: () {
                          print("back");
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(Icons.search),
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration.collapsed(
                              hintText: "Search",
                            ),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(Icons.settings_input_component)),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView.separated(
                      itemCount: snapshot.data!.length,
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 20,
                        );
                      },
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              nameOfIDCategory[index].toString(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: ListView.separated(
                                separatorBuilder: (context, index) {
                                  return const SizedBox(
                                    height: 20,
                                  );
                                },
                                itemCount: snapshot.data!.values
                                    .elementAt(index)
                                    .length,
                                itemBuilder: (context, index3) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Row(
                                      children: [
                                        Flexible(
                                          flex: 1,
                                          child: Container(
                                              width: 120,
                                              height: 120,
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: DecorationImage(
                                                  image: NetworkImage(snapshot
                                                      .data!.values
                                                      .elementAt(index)[index3]
                                                      .thumb),
                                                  fit: BoxFit.cover,
                                                ),
                                              )),
                                        ),
                                        Flexible(
                                          flex: 1,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(snapshot.data!.values
                                                    .elementAt(index)[index3]
                                                    .category
                                                    .name),
                                                Text(
                                                  snapshot.data!.values
                                                      .elementAt(index)[index3]
                                                      .title,
                                                  maxLines: 2,
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  snapshot.data!.values
                                                      .elementAt(index)[index3]
                                                      .description,
                                                  maxLines: 2,
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                                shrinkWrap: true,
                                physics: const ClampingScrollPhysics(),
                                scrollDirection: Axis.vertical,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
