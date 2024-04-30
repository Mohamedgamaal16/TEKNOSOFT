
import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';

class ScrolablePics extends StatelessWidget {
  const ScrolablePics({
    super.key,
    required this.pics,
  });

  final List<String> pics;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 343 / 242,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: AnotherCarousel(
            boxFit: BoxFit.fill,
            dotBgColor: Colors.transparent,
            dotColor: Colors.black,
            dotSize: 8,
            dotSpacing: 15,
            autoplay: false,
            images: List.generate(
                pics.length,
                (index) => Image.asset(
                      pics[index],
                      fit: BoxFit.fill,
                    ))),
      ),
    );
  }
}
