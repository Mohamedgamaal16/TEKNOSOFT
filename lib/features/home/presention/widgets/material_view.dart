import 'package:climb_up/features/home/presention/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class MaterialView extends StatelessWidget {
  const MaterialView({super.key});
static List<List<String>> pics = const [
    [
      "assets/images/wood/maxresdefault.jpg",
      "assets/images/wood/wood.jpg",
      "assets/images/wood/wood1.jpg"
    ],
    [
      "assets/images/threads/cottonkh1.jpg",
      "assets/images/threads/cottonkh2.jpg",
      "assets/images/threads/cottonkh3.jpg"
    ],
    [
      "assets/images/threads/macrame.jpeg",
      // "assets/images/threads/macrame2.jpeg",
    ],
    [
      "assets/images/threads/treko.jpg",
      "assets/images/threads/treko2.jpg",
      "assets/images/threads/treko3.jpg"
    ],
    [
      "assets/images/fabric/beka 1.jpg",
      "assets/images/fabric/beka2.jpg",
      "assets/images/fabric/beka3.jpeg",
      "assets/images/fabric/beka4.jpg"
    ],
    [
      "assets/images/fabric/caro 2.jpeg",
      "assets/images/fabric/caro1.jpeg",
    ],
    [
      "assets/images/fabric/cotton1.jpg",
      "assets/images/fabric/cotton2.jpg",
      "assets/images/fabric/cotton3.jpg"
    ],
    [
      "assets/images/fabric/ketan 2 .jpg",
      "assets/images/fabric/ketan 3jpg.jpg",
      "assets/images/fabric/ketan1.jpg"
    ],
    [
      "assets/images/fabric/stan1.jpeg",
      "assets/images/fabric/stan2.jpg",
      "assets/images/fabric/stan3.jpg"
    ],
    [
      "assets/images/mirrors/merror3.jpg",
      "assets/images/mirrors/mirror1.jpg",
      "assets/images/mirrors/mirror2jfif.jpg"
    ],
    [
      "assets/images/mirrors/sqmirror1.jpg",
      "assets/images/mirrors/sqmirror2.jpg"
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: pics.length,
      itemBuilder: (BuildContext context, int index) {
        return  Padding(
          padding: const EdgeInsets.symmetric(vertical:8.0),
          child: CustomCard(pics: pics[index],)
        );
      },
    );
  }
}
