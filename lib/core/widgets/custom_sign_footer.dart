import 'package:climb_up/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomSignFooter extends StatelessWidget {
  const CustomSignFooter({
    super.key,
     required this.pageName, required this.onTap, required this.sentence,
  });
final String pageName,sentence;
final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: AppStyles.poppinsStyleRegular14(context),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            'Sign Up',
            style: AppStyles.poppinsStyleBold14(context),
          ),
        )
      ],
    );
  }
}
