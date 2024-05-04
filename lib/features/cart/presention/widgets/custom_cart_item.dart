import 'package:climb_up/core/utils/app_styles.dart';
import 'package:climb_up/features/cart/presention/widgets/custom_pic.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomCartItem extends StatelessWidget {
  const CustomCartItem({
    Key? key,
    required this.price,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

  final String title, imageUrl;
  final double price;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Expanded(
        child: CustomPic(
          imageUrl: imageUrl,
        ),
      ),
      title: Text(
        title,
        style: AppStyles.poppinsStyleBold18(context),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Row(
        children: [
          Text(
            '${price} EGP',
            style: AppStyles.interStyleRegular12(context),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.trash,
              size: 18,
            ),
          ),
        ],
      ),
    );
  }
}
