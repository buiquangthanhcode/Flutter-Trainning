import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:ui_category/category_provider/category_provider.dart';
import 'package:ui_category/page/widget/background.dart';
import 'package:ui_category/page/widget/blur.dart';
import 'package:ui_category/page/widget/slider.dart';

import '../modal/category.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  // final categories;
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackGround(),
          const Blur(),
          const Positioned.fill(
            child: SliderCustom(),
          )
        ],
      ),
    );
  }
}
