import 'package:climb_up/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardDetailes extends StatelessWidget {
  const CardDetailes({
    super.key,
    required this.title,
    required this.rate,
  });

  final String title;
  final String rate;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,
            style: AppStyles.poppinsStyleSemiBold16(context)
                .copyWith(color: Colors.black)),
        const Spacer(),
        const Icon(
          FontAwesomeIcons.solidStar,
          size: 18,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(rate,
            style: AppStyles.poppinsStyleBold14(context)
                .copyWith(color: Colors.black))
      ],
    );
  }
}
