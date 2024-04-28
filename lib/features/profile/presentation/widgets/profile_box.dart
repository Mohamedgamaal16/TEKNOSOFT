import 'package:climb_up/core/utils/app_styles.dart';
import 'package:climb_up/features/profile/data/models/profile_model.dart';
import 'package:flutter/material.dart';

class ProfileBox extends StatelessWidget {
  const ProfileBox({
    super.key,
    required this.profileModel,
  });
  final ProfileModel profileModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 36,
        ),
        const SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              profileModel.name,
              style: AppStyles.interStyleBold12(context).copyWith(
                fontSize: 14,
              ),
            ),
            Text(
              profileModel.userName,
              style: AppStyles.interStyleRegular12(context),
            )
          ],
        )
      ],
    );
  }
}
