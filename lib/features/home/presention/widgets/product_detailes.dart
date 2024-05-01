import 'package:climb_up/features/home/presention/widgets/product_detailes_body.dart';
import 'package:flutter/material.dart';

class ProductDisplay extends StatelessWidget {
  const ProductDisplay({
    super.key,
    required this.title,
    required this.detaiales,
    required this.rate,
    required this.price,
    required this.pic,
  });
  final List<String> pic;

  final String title, detaiales, rate, price;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Title(color: Colors.black, child: const Text('Back')),
      ),
      body: ProductDisplayBody(
        pic: pic,
        rate: rate,
        price: price,
        detailes: detaiales,
        title: title,
      ),
    ));
  }
}
