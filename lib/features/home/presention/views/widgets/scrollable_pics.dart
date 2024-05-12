import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';

class ScrollablePics extends StatelessWidget {
  const ScrollablePics({
    super.key,
    required this.pics,
    required this.smallerPaddingHeight,
    this.netWorkImage = false,
  });

  final bool smallerPaddingHeight;
  final List<String> pics;
  final bool netWorkImage;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 343 / 242,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: AnotherCarousel(
          indicatorBgPadding: smallerPaddingHeight ? 5 : 20,
          boxFit: BoxFit.fill,
          dotBgColor: Colors.transparent,
          dotColor: Colors.black,
          dotSize: 8,
          dotSpacing: 15,
          autoplay: false,
          images: List.generate(
            pics.length,
            (index) => netWorkImage
                ? NetworkImage(pics[index])
                : AssetImage(pics[index]),
          ),
        ),
      ),
    );
  }
}
