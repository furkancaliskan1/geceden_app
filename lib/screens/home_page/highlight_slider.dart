import 'package:app_geceden/models/highlight.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HighlightSlider extends StatelessWidget {
  final List<Highlight> highlights;

  const HighlightSlider({super.key, required this.highlights});

  @override
  Widget build(BuildContext context) {
    if (highlights.isEmpty) {
      return const Center();
    } else {
      return CarouselSlider.builder(
        options: CarouselOptions(
          height: 200,
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
        ),
        itemCount: highlights.length,
        itemBuilder: (context, index, realIndex) {
          return Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              image: DecorationImage(
                image: NetworkImage(highlights[index].photoUrl),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      );
    }
  }
}

