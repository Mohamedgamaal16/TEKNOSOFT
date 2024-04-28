import 'package:climb_up/core/extensions/string_extensions.dart';
import 'package:climb_up/features/profile/data/models/profile_model.dart';
import 'package:climb_up/features/profile/presentation/widgets/profile_tile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        ProfileTile(
          icon: FontAwesomeIcons.venus,
          title: 'Gender',
          subTitle: profileModel.gender.name.capitalize(),
        ),
        ProfileTile(
          icon: FontAwesomeIcons.solidEnvelope,
          title: 'Email',
          subTitle: profileModel.email,
        ),
        ProfileTile(
          icon: FontAwesomeIcons.phone,
          title: 'Phone',
          subTitle: profileModel.phone,
        ),
        const ProfileTile(
          icon: FontAwesomeIcons.lock,
          title: 'Change Password',
          subTitle: '**********',
        ),
        const ProfileTile(
          icon: FontAwesomeIcons.circleInfo,
          title: 'About',
          subTitle: '',
        ),
      ],
    );
  }
}
