import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:climb_up/core/utils/app_styles.dart';
import 'package:climb_up/features/home/data/models/material_model.dart';
import 'package:climb_up/features/home/presention/widgets/custom_detailes.dart';
import 'package:climb_up/features/home/presention/widgets/scrollable_pics.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.materialProductModel,
  });

  final MaterialProductModel materialProductModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ScrollablePics(
          pics: materialProductModel.pics,
          smallerPaddingHeight: true,
        ),
        const SizedBox(
          height: 16,
        ),
        CardDetailes(materialProductModel: materialProductModel,
           ),
        const SizedBox(
          height: 4,
        ),
        Text(
          'View more',
          style: AppStyles.poppinsStyleRegular14(context)
              .copyWith(color: const Color(0xFF94929A)),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          '${materialProductModel.price} EGP',
          style: AppStyles.poppinsStyleBold14(context)
              .copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
