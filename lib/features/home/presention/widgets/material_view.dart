import 'package:climb_up/features/home/presention/widgets/custom_card.dart';
import 'package:climb_up/features/home/presention/widgets/product_detailes.dart';
import 'package:flutter/material.dart';

class MaterialView extends StatelessWidget {
  const MaterialView({super.key});
  static List<List<String>> pics = const [
    [
      "assets/images/wood/wood1.jpg",
      "assets/images/wood/wood.jpg",
      "assets/images/wood/maxresdefault.jpg",
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
  static List<String> titles = const [
    "Wood",
    "Cotton Threads",
    "Macrame Threads",
    "Treko Threads",
    "Beka Fabric",
    "Caro Fabric",
    "Cotton Fabric",
    "Ketan Fabric",
    "Stan Fabric",
    "Rounded Mirrors",
    "Square Mirrors"
  ];
  static List<String> rate = const [
    "5",
    "4.2",
    "3",
    "5",
    "3",
    "4.5",
    "5",
    "4.6",
    "4",
    "5",
    "3.5"
  ];
  static List<String> price = const [
    "250",
    "100",
    "200",
    "150",
    "60",
    "40",
    "50",
    "52",
    "46",
    "82",
    "120"
  ];
static List<String> details = const [
  "Wood: High-quality wood for crafting and DIY projects. Perfect for furniture making, woodworking projects, and creating unique home decor pieces. Available in various types like pine, oak, and maple, each with its distinct properties and grain patterns.",
  "Cotton Threads: Soft and smooth cotton threads, ideal for sewing, knitting, and embroidery. Strong and versatile, they come in a wide range of colors and thicknesses, allowing you to create everything from delicate embroidery projects to durable garments. Perfect for both beginners and experienced crafters.",
  "Macrame Threads: Durable macrame threads specifically designed for creating beautiful wall hangings, plant hangers, and other macrame crafts. Made from high-quality materials that resist fraying and knot easily, these threads come in various thicknesses and colors to suit your creative vision.",
  "Treko Threads: Strong and versatile Treko threads suitable for various textile applications. Used for sewing, upholstery, and crafting projects requiring additional strength. Available in a range of colors to complement your design needs.",
  "Beka Fabric: Luxurious Beka fabric with a soft texture, perfect for apparel and home decor. This high-quality fabric drapes beautifully and adds a touch of elegance to dresses, skirts, curtains, and throws. Available in a variety of colors and patterns to suit your style.",
  "Caro Fabric: Elegant Caro fabric with a beautiful drape, ideal for dresses, curtains, and more. This lightweight fabric is breathable and comfortable, making it perfect for creating flowy garments and flowing window treatments. Available in a range of solid colors and subtle patterns.",
  "Cotton Fabric: Breathable and comfortable cotton fabric for everyday clothing and crafting. This versatile fabric is a staple for creating shirts, pants, dresses, and various DIY projects. Available in a wide range of colors and weights to suit your needs.",
  "Ketan Fabric: Stylish Ketan fabric with a unique texture, suitable for upholstery and fashion. This durable fabric offers a distinct look and feel, making it ideal for creating statement pieces like furniture upholstery, bags, and jackets. Available in a range of colors and textures.",
  "Stan Fabric: Durable Stan fabric ideal for outdoor projects and bags. This water-resistant fabric is perfect for creating outdoor cushions, backpacks, and other items that need to withstand the elements. Available in a variety of colors for a functional and stylish look.",
  "Rounded Mirrors: Modern and sleek rounded mirrors for enhancing any room's decor. These stylish mirrors add a touch of softness and visual interest to a space. Available in various sizes to suit your needs, they can be used on walls, dressers, or as part of a larger mirror installation.",
  "Square Mirrors: Functional and stylish square mirrors for adding depth and light to a space. These classic mirrors offer a versatile design that complements various decor styles. Available in different sizes, they can be used above bathroom sinks, on walls, or as part of a gallery wall arrangement."
];


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: pics.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (builder) {
                  return ProductDisplay(
                      title: titles[index],
                      detaiales: details[index],
                      rate: rate[index],
                      price: price[index],
                      pic: pics[index]);
                }));
              },
              child: CustomCard(
                pics: pics[index],
                title: titles[index],
                rate: rate[index],
                price: price[index],
              ),
            ));
      },
    );
  }
}
