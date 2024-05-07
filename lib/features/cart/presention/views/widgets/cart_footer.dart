import 'package:climb_up/core/utils/app_styles.dart';
import 'package:climb_up/core/utils/constants.dart';
import 'package:climb_up/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CartFooter extends StatelessWidget {
  const CartFooter({
    super.key,
    required this.totalPrice,
  });
  final int totalPrice;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          const SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Price',
                style: AppStyles.poppinsStyleRegular12(context)
                    .copyWith(color: Colors.black54),
              ),
              Text(
                // ignore: unnecessary_brace_in_string_interps
                '${totalPrice} EGP',
                style: AppStyles.poppinsStyleBold18(context),
              ),
            ],
          ),
          const Spacer(),
          SizedBox(
            height: MediaQuery.of(context).size.height * .07,
            child: CustomButton(
              labelName: 'Check Out',
              color: AppColors.kPrimaryColor,
              textColor: Colors.white,
              onPressed: () async {},
            ),
          ),
        ],
      ),
    );
  }
}
