import 'package:climb_up/core/utils/app_styles.dart';
import 'package:climb_up/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    this.onTap,
  });
  final IconData icon;
  final String title;
  final String subTitle;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: GestureDetector(
        onTap: onTap,
        child: Row(children: [
          Icon(
            icon,
            color: AppColors.kPrimaryColor,
            size: 24,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            title,
            style: AppStyles.interStyleBold12(context),
          ),
          const Spacer(),
          Text(
            subTitle,
            style: AppStyles.interStyleRegular12(context),
          ),
          const SizedBox(
            width: 8,
          ),
          const Icon(
            FontAwesomeIcons.chevronRight,
            size: 12,
            color: AppColors.kGrayTextColor,
          ),
        ]),
      ),
    );
  }
}
