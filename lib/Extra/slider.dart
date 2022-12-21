import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';

class SlidersScreen extends StatefulWidget {
  const SlidersScreen({super.key});

  @override
  State<SlidersScreen> createState() => _SlidersScreenState();
}

class _SlidersScreenState extends State<SlidersScreen> {
  int _current = 0;
  // ignore: prefer_final_fields
  CarouselController _controller = CarouselController();
  List<String> url = [
    'images/firstimage.png',
    'images/tukiyo.jpg',
    'images/london.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
            itemCount: url.length,
            itemBuilder: ((context, index, realIndex) => Container(
                  height: 336,
                  width: 288,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage(url[index]), fit: BoxFit.cover),
                  ),
                )),
            carouselController: _controller,
            options: CarouselOptions(
              autoPlay: true,
              height: 336,
              enableInfiniteScroll: false,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: url.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.blue)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
