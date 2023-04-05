import 'dart:ffi';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:ui_category/category_provider/category_provider.dart';

import '../../modal/category.dart';
import '../detail_ui.dart';

class SliderCustom extends StatelessWidget {
  const SliderCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: CarouselSlider(
        options: CarouselOptions(
            height: 700,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            initialPage: 0,
            onPageChanged: (index, _) {
            
              Provider.of<CategoryProvider>(context, listen: false)
                  .setCurrent(index);
            },
            enableInfiniteScroll: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            scrollDirection: Axis.vertical),
        items: Provider.of<CategoryProvider>(context).categories.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                clipBehavior: Clip.antiAlias,
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                    color: Colors.amber,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 3),
                        color: Colors.blue.shade300,
                        blurRadius: 5,
                      )
                    ],
                    borderRadius: BorderRadius.circular(20)),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: DetailUI(category: i),
                                  type: PageTransitionType.bottomToTop));
                        },
                        child: Hero(
                          tag: i.id,
                          child: Image.network(
                            i.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned.fill(
                        child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Text(
                              i.name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                          ),
                          const Spacer(
                            flex: 8,
                          ),
                          Flexible(
                            flex: 1,
                            child: RatingBar.builder(
                              initialRating: 3,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding: const EdgeInsets.only(
                                  top: 5.0, bottom: 5.0, right: 5.0),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {},
                            ),
                          ),
                          Flexible(
                              flex: 2,
                              child: Text(
                                i.description,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ))
                        ],
                      ),
                    )),
                  ],
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
