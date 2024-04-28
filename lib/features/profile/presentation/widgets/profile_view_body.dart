import 'package:climb_up/core/utils/app_styles.dart';
import 'package:climb_up/features/profile/data/models/profile_model.dart';
import 'package:climb_up/features/profile/presentation/widgets/profile_box.dart';
import 'package:climb_up/features/profile/presentation/widgets/profile_tiles_list_view.dart';
import 'package:flutter/material.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    const ProfileModel profileModel = ProfileModel(
      name: 'Ahmed Yasser',
      userName: '@ahmed',
      email: 'ahmed.yasser@gmail.com',
      phone: '01028825215',
      imageLink: '',
      password: 'password',
      gender: Gender.male,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 32,
          ),
          Text(
            'My Profile',
            style: AppStyles.interStyleBold12(context).copyWith(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          const ProfileBox(
            profileModel: profileModel,
          ),
          const ProfileTilesListView(
            profileModel: profileModel,
          )
        ],
      ),
    );
  }
}
