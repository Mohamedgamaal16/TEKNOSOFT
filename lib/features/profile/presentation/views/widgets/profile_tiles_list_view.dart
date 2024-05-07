import 'package:climb_up/core/utils/app_router.dart';
import 'package:climb_up/features/profile/presentation/view_models/profile_cubit/profile_cubit.dart';
import 'package:climb_up/features/profile/presentation/views/widgets/gender_selector.dart';
import 'package:climb_up/features/profile/presentation/views/widgets/profile_expansion_tile.dart';
import 'package:climb_up/features/profile/presentation/views/widgets/profile_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class ProfileTilesListView extends StatelessWidget {
  const ProfileTilesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ProfileCubit profileCubit = ProfileCubit.get(context);
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Column(
          children: [
            ProfileExpansionTile(
              icon: FontAwesomeIcons.venus,
              title: 'Gender',
              subTitle: profileCubit.profileModel.gender,
              expandedWidget: const GenderSelector(),
            ),
            ProfileListTile(
              icon: FontAwesomeIcons.solidEnvelope,
              title: 'Email',
              subTitle: profileCubit.profileModel.email,
            ),
            ProfileListTile(
              icon: FontAwesomeIcons.phone,
              title: 'Phone',
              subTitle: profileCubit.profileModel.phone,
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
            const ProfileListTile(
              icon: FontAwesomeIcons.arrowRightFromBracket,
              title: 'Log Out',
              subTitle: '',
              color: Color.fromARGB(255, 255, 17, 0),
            ),
          ],
        );
      },
    );
  }
}
