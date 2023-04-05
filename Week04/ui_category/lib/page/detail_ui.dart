import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailUI extends StatelessWidget {
  DetailUI({super.key, required this.category});
  var category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Hero(
                  tag: category.id,
                  child: Image.network(
                    category.image,
                    fit: BoxFit.cover,
                  ),
                ),
              )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: SlideInUp(
                    delay: Duration(microseconds: 300),
                    child: Text(
                      category.name,
                      style: TextStyle(fontSize: 26, color: Colors.grey),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: SlideInUp(
                    delay: Duration(microseconds: 1200),
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
                ),
                const SizedBox(
                  height: 20,
                ),
                SlideInUp(
                  delay: const Duration(microseconds: 1000),
                  child: Text(
                    category.description,
                    style: TextStyle(color: Colors.grey),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
