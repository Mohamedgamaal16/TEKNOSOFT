import 'package:climb_up/core/utils/app_styles.dart';
import 'package:climb_up/core/utils/constants.dart';
import 'package:climb_up/features/home/data/models/material_model.dart';
import 'package:climb_up/features/home/presention/views/widgets/product_detailes_body.dart';
import 'package:flutter/material.dart';

class ProductDisplay extends StatelessWidget {
  const ProductDisplay({
    super.key,
    required this.materialProductModel,
    required this.call,
  });
  final MaterialProductModel materialProductModel;
  final bool call;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.kPrimaryColor,
        title: Title(
            color: AppColors.kPrimaryColor,
            child: Text(
              'Back',
              style: AppStyles.poppinsStyleMedium16(context),
            )),
      ),
      body: ProductDisplayBody(
        pic: materialProductModel.pics,
        rate: materialProductModel.rate,
        price: materialProductModel.price,
        detailes: materialProductModel.details,
        title: materialProductModel.title,
        call: call,
      ),
    ));
  }
}
