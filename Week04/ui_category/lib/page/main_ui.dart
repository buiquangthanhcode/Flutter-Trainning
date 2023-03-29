import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_swipe/flutter_swipe.dart';
import 'package:provider/provider.dart';
import 'package:ui_category/category_provider/category_provider.dart';
import 'package:ui_category/page/detail_ui.dart';

class UI extends StatefulWidget {
  const UI({super.key});

  @override
  State<UI> createState() => _UIState();
}

class _UIState extends State<UI> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<CategoryProvider>(context, listen: false).readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SwipeBody(items: Provider.of<CategoryProvider>(context).getItems()),
    );
  }
}

class SwipeBody extends StatefulWidget {
  SwipeBody({Key? key, required this.items}) : super(key: key);
  var items;

  @override
  State<SwipeBody> createState() => _SwipeBodyState();
}

class _SwipeBodyState extends State<SwipeBody> {
  double _scale = 1.0;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Opacity(
        opacity: 0.5,
        child: Image.network(
          'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/433c78d9-d308-4b38-9ced-ec10f3c3bc88/dfg16o5-c9ba958b-362a-42e0-94f5-27fc8ae1340e.png/v1/fill/w_1280,h_768,q_80,strp/coast_at_night_study__6___made_with_ai__by_kroniksan_dfg16o5-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzQzM2M3OGQ5LWQzMDgtNGIzOC05Y2VkLWVjMTBmM2MzYmM4OFwvZGZnMTZvNS1jOWJhOTU4Yi0zNjJhLTQyZTAtOTRmNS0yN2ZjOGFlMTM0MGUucG5nIiwiaGVpZ2h0IjoiPD03NjgiLCJ3aWR0aCI6Ijw9MTI4MCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS53YXRlcm1hcmsiXSwid21rIjp7InBhdGgiOiJcL3dtXC80MzNjNzhkOS1kMzA4LTRiMzgtOWNlZC1lYzEwZjNjM2JjODhcL2tyb25pa3Nhbi00LnBuZyIsIm9wYWNpdHkiOjk1LCJwcm9wb3J0aW9ucyI6MC40NSwiZ3Jhdml0eSI6ImNlbnRlciJ9fQ.L8FikWkVbNm2Xn4ZXd1tCekZyxYUtonwrRg8t6e-fQU',
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
      ),
      Container(
        padding: const EdgeInsets.all(20),
        child: Swiper(
          layout: SwiperLayout.DEFAULT,
          scrollDirection: Axis.vertical,
          itemCount: widget.items.length,
          scale: 0.8,
          viewportFraction: 0.65,
          itemBuilder: (BuildContext context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Consumer<CategoryProvider>(
                builder: (context, value, child) {
                  return GridTile(
                    header: GridTileBar(
                        title: Text(
                      value.getItems()[index].name,
                      style: const TextStyle(fontSize: 22),
                    )),
                    footer: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RatingBar.builder(
                              initialRating: 3,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding: const EdgeInsets.symmetric(
                                  horizontal: 4.0, vertical: 4.0),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {},
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              overflow: TextOverflow.clip,
                              value.getItems()[index].description,
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.white),
                            ),
                          ]),
                    ),
                    child: InkWell(
                      onTap: () {
                        
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailUI(category: value.getItems()[index])),
                        );
                      },
                      child: Image.network(
                        value.getItems()[index].image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    ]);
  }
}
