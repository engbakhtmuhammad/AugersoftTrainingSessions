import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../items.dart';


class MyCarouselSlider extends StatefulWidget {
  const MyCarouselSlider(
      {Key? key, required this.imgSliders, required this.context, required this.controller})
      : super(key: key);
  final List<Widget> imgSliders;
  final BuildContext context;
  final CarouselController controller;
  @override
  _MyCarouselSliderState createState() => _MyCarouselSliderState();
}

class _MyCarouselSliderState extends State<MyCarouselSlider> {
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        CarouselSlider(
          items: widget.imgSliders,
          carouselController: widget.controller,
          options: CarouselOptions(
              height: 500,
              autoPlay: true,
              initialPage: 0,
              viewportFraction: 1.0,
              onPageChanged: (index, reason) {
                setState(() {
                  current = index;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: getItems().asMap().entries.map((index) {
            return GestureDetector(
              onTap: () => widget.controller.animateToPage(index.key),
              child: Container(
                width: current == index.key ? 10.0 : 6.0,
                height: current == index.key ? 10.0 : 6.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (current == index.key
                        ? Colors.blue
                        : Colors.blue[200])),
              ),
            );
          }).toList(),
        ),
      ]),
    );
  }
}
