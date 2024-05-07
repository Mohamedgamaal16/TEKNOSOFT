import 'package:climb_up/features/home/data/models/material_model.dart';
import 'package:climb_up/features/home/presention/views/widgets/custom_card.dart';
import 'package:climb_up/features/home/presention/views/widgets/product_detailes.dart';
import 'package:flutter/material.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  static const List<MaterialProductModel> materialProducts = [
    MaterialProductModel(
      pics: [
        "assets/images/wood/wood1.jpg",
        "assets/images/wood/wood.jpg",
        "assets/images/wood/maxresdefault.jpg",
      ],
      title: "Wood",
      rate: "5",
      price: "250",
      details:
          "Wood: High-quality wood for crafting and DIY projects. Perfect for furniture making, woodworking projects, and creating unique home decor pieces. Available in various types like pine, oak, and maple, each with its distinct properties and grain patterns.",
    ),
    MaterialProductModel(
      pics: [
        "assets/images/threads/cottonkh1.jpg",
        "assets/images/threads/cottonkh2.jpg",
        "assets/images/threads/cottonkh3.jpg",
      ],
      title: "Cotton Threads",
      rate: "4.2",
      price: "100",
      details:
          "Cotton Threads: Soft and smooth cotton threads, ideal for sewing, knitting, and embroidery. Strong and versatile, they come in a wide range of colors and thicknesses, allowing you to create everything from delicate embroidery projects to durable garments. Perfect for both beginners and experienced crafters.",
    ),
    MaterialProductModel(
      pics: [
        "assets/images/threads/macrame.jpeg",
        // "assets/images/threads/macrame2.jpeg",
      ],
      title: "Macrame Threads",
      rate: "3",
      price: "200",
      details:
          "Macrame Threads: Durable macrame threads specifically designed for creating beautiful wall hangings, plant hangers, and other macrame crafts. Made from high-quality materials that resist fraying and knot easily, these threads come in various thicknesses and colors to suit your creative vision.",
    ),
    MaterialProductModel(
      pics: [
        "assets/images/threads/treko.jpg",
        "assets/images/threads/treko2.jpg",
        "assets/images/threads/treko3.jpg",
      ],
      title: "Treko Threads",
      rate: "5",
      price: "150",
      details:
          "Treko Threads: Strong and versatile Treko threads suitable for various textile applications. Used for sewing, upholstery, and crafting projects requiring additional strength. Available in a range of colors to complement your design needs.",
    ),
    MaterialProductModel(
      pics: [
        "assets/images/fabric/beka 1.jpg",
        "assets/images/fabric/beka2.jpg",
        "assets/images/fabric/beka3.jpeg",
        "assets/images/fabric/beka4.jpg",
      ],
      title: "Beka Fabric",
      rate: "3",
      price: "60",
      details:
          "Beka Fabric: Luxurious Beka fabric with a soft texture, perfect for apparel and home decor. This high-quality fabric drapes beautifully and adds a touch of elegance to dresses, skirts, curtains, and throws. Available in a variety of colors and patterns to suit your style.",
    ),
    MaterialProductModel(
      pics: [
        "assets/images/fabric/caro 2.jpeg",
        "assets/images/fabric/caro1.jpeg",
      ],
      title: "Caro Fabric",
      rate: "4.5",
      price: "40",
      details:
          "Caro Fabric: Elegant Caro fabric with a beautiful drape, ideal for dresses, curtains, and more. This lightweight fabric is breathable and comfortable, making it perfect for creating flowy garments and flowing window treatments. Available in a range of solid colors and subtle patterns.",
    ),
    MaterialProductModel(
      pics: [
        "assets/images/fabric/cotton1.jpg",
        "assets/images/fabric/cotton2.jpg",
        "assets/images/fabric/cotton3.jpg",
      ],
      title: "Cotton Fabric",
      rate: "5",
      price: "50",
      details:
          "Cotton Fabric: Breathable and comfortable cotton fabric for everyday clothing and crafting. This versatile fabric is a staple for creating shirts, pants, dresses, and various DIY projects. Available in a wide range of colors and weights to suit your needs.",
    ),
    MaterialProductModel(
      pics: [
        "assets/images/fabric/ketan 2 .jpg",
        "assets/images/fabric/ketan 3jpg.jpg",
        "assets/images/fabric/ketan1.jpg",
      ],
      title: "Ketan Fabric",
      rate: "4.6",
      price: "52",
      details:
          "Ketan Fabric: Stylish Ketan fabric with a unique texture, suitable for upholstery and fashion. This durable fabric offers a distinct look and feel, making it ideal for creating statement pieces like furniture upholstery, bags, and jackets. Available in a range of colors and textures.",
    ),
    MaterialProductModel(
      pics: [
        "assets/images/fabric/stan1.jpeg",
        "assets/images/fabric/stan2.jpg",
        "assets/images/fabric/stan3.jpg",
      ],
      title: "Stan Fabric",
      rate: "4",
      price: "46",
      details:
          "Stan Fabric: Durable Stan fabric ideal for outdoor projects and bags. This water-resistant fabric is perfect for creating outdoor cushions, backpacks, and other items that need to withstand the elements. Available in a variety of colors for a functional and stylish look.",
    ),
    MaterialProductModel(
      pics: [
        "assets/images/mirrors/merror3.jpg",
        "assets/images/mirrors/mirror1.jpg",
        "assets/images/mirrors/mirror2jfif.jpg",
      ],
      title: "Rounded Mirrors",
      rate: "5",
      price: "82",
      details:
          "Rounded Mirrors: Modern and sleek rounded mirrors for enhancing any room's decor. These stylish mirrors add a touch of softness and visual interest to a space. Available in various sizes to suit your needs, they can be used on walls, dressers, or as part of a larger mirror installation.",
    ),
    MaterialProductModel(
      pics: [
        "assets/images/mirrors/sqmirror1.jpg",
        "assets/images/mirrors/sqmirror2.jpg",
      ],
      title: "Square Mirrors",
      rate: "3.5",
      price: "120",
      details:
          "Square Mirrors: Functional and stylish square mirrors for adding depth and light to a space. These classic mirrors offer a versatile design that complements various decor styles. Available in different sizes, they can be used above bathroom sinks, on walls, or as part of a gallery wall arrangement.",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: materialProducts.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (builder) {
                  return ProductDisplay(
                    materialProductModel: materialProducts[index],
                    call: true,
                  );
                }));
              },
              child: CustomCard(
                materialProductModel: materialProducts[index],
              ),
            ));
      },
    );
  }
}
