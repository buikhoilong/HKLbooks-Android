import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
final List<String> Banner = [
  'assets/images/Banner.png',
  'assets/images/Banner3.png',
  'assets/images/Banner4.png',
  'assets/images/Banner5.png',
];

List<Widget> generateImages() {
  return Banner.map((element) => ClipRRect(
        child: Image.asset(
          element,
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10.0),
      )).toList();
}

class MyBanner extends StatelessWidget {
  const MyBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: generateImages(),
        options: CarouselOptions(
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 18 / 8,
        ));
  }
}
