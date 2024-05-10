import 'package:climb_up/core/utils/app_router.dart';
import 'package:climb_up/core/utils/app_styles.dart';
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
    ProfileCubit profileCubit = BlocProvider.of(context);
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
            ProfileListTile(
              icon: FontAwesomeIcons.arrowRightFromBracket,
              title: 'Log Out',
              subTitle: '',
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        elevation: 0,
                        backgroundColor: Colors.white,
                        title: Text(
                          'Log out',
                          style: AppStyles.poppinsStyleSemiBold16(context)
                              .copyWith(
                            color: Colors.black,
                          ),
                        ),
                        content: Text(
                          'Are you sure you want to log out?',
                          style: AppStyles.interStyleRegular12(context),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Back',
                              style: AppStyles.interStyleRegular12(context)
                                  .copyWith(color: Colors.black),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              profileCubit.logOut(context);
                            },
                            child: Text(
                              'Log Out',
                              style: AppStyles.interStyleRegular12(context)
                                  .copyWith(color: Colors.black),
                            ),
                          ),
                        ],
                      );
                    });
                // profileCubit.logOut(context);
              },
              color: const Color.fromARGB(255, 255, 17, 0),
            ),
          ],
        );
      },
    );
  }
}
