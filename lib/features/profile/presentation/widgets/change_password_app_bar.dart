import 'package:climb_up/core/utils/app_styles.dart';
import 'package:climb_up/core/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class ChangePasswordAppBar extends StatelessWidget {
  const ChangePasswordAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                GoRouter.of(context).pop();
              },
              child: Container(
                color: Colors.transparent,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      FontAwesomeIcons.chevronLeft,
                      color: AppColors.kPrimaryColor,
                      size: 12,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Back',
                      style: AppStyles.poppinsStyleRegular12(context),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          'Change Password',
          style: AppStyles.poppinsStyleBold24(context),
        )
      ],
    );
  }
}
