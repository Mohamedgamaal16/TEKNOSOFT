import 'package:climb_up/features/home/data/models/material_model.dart';
import 'package:climb_up/features/home/presention/widgets/product_detailes_body.dart';
import 'package:flutter/material.dart';

class ProductDisplay extends StatelessWidget {
  const ProductDisplay({
    super.key,required this.materialProductModel,
   
  });
    final MaterialProductModel materialProductModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Title(color: Colors.black, child: const Text('Back')),
      ),
      body: ProductDisplayBody(
        pic: materialProductModel.pics,
        rate: materialProductModel.rate,
        price: materialProductModel.price,
        detailes: materialProductModel.details,
        title: materialProductModel.title,
      ),
    ));
  }
}
