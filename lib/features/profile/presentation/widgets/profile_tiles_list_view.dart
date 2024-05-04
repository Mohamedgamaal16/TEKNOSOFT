import 'package:climb_up/core/extensions/string_extensions.dart';
import 'package:climb_up/core/utils/app_router.dart';
import 'package:climb_up/features/profile/data/models/profile_model.dart';
import 'package:climb_up/features/profile/presentation/widgets/gender_selector.dart';
import 'package:climb_up/features/profile/presentation/widgets/profile_expansion_tile.dart';
import 'package:climb_up/features/profile/presentation/widgets/profile_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class ProfileTilesListView extends StatelessWidget {
  const ProfileTilesListView({
    super.key,
    required this.profileModel,
  });
  final ProfileModel profileModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileExpansionTile(
          icon: FontAwesomeIcons.venus,
          title: 'Gender',
          subTitle: profileModel.gender.name.capitalize(),
          expandedWidget: const GenderSelector(),
        ),
        ProfileExpansionTile(
          icon: FontAwesomeIcons.solidEnvelope,
          title: 'Email',
          subTitle: profileModel.email,
          expandedWidget: const SizedBox(),
        ),
        ProfileExpansionTile(
          icon: FontAwesomeIcons.phone,
          title: 'Phone',
          subTitle: profileModel.phone,
          expandedWidget: const SizedBox(),
        ),
        ProfileListTile(
          icon: FontAwesomeIcons.lock,
          title: 'Change Password',
          subTitle: '**********',
          onTap: () {
            GoRouter.of(context).push(AppRouter.kChangePassword);
          },
        ),
        const ProfileListTile(
          icon: FontAwesomeIcons.circleInfo,
          title: 'About',
          subTitle: '',
        ),
      ],
    );
  }
}
