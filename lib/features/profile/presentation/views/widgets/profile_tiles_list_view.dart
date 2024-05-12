import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import 'package:climb_up/core/utils/app_router.dart';
import 'package:climb_up/core/utils/app_styles.dart';
import 'package:climb_up/features/profile/presentation/view_models/get_user_data_cubit/get_user_data_cubit.dart';
import 'package:climb_up/features/profile/presentation/views/widgets/gender_selector.dart';
import 'package:climb_up/features/profile/presentation/views/widgets/profile_expansion_tile.dart';
import 'package:climb_up/features/profile/presentation/views/widgets/profile_list_tile.dart';

class ProfileTilesListView extends StatelessWidget {
  const ProfileTilesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserDataCubit, GetUserDataState>(
      builder: (context, state) {
        if (state is GetUserDataSuccess) {
          return Column(
            children: [
              ProfileExpansionTile(
                icon: FontAwesomeIcons.venus,
                title: 'Gender',
                subTitle: state.userModel.data.user.role,
                expandedWidget: const GenderSelector(),
              ),
              ProfileListTile(
                icon: FontAwesomeIcons.solidEnvelope,
                title: 'Email',
                subTitle: state.userModel.data.user.email,
              ),
              ProfileListTile(
                icon: FontAwesomeIcons.phone,
                title: 'Phone',
                subTitle: state.userModel.data.user.id,
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
                  _showLogoutDialog(context);
                },
                color: const Color.fromARGB(255, 255, 17, 0),
              ),
            ],
          );
        } else if (state is GetUserDataFaliure) {
          return Text(state.errMessage);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            'Log out',
            style: AppStyles.poppinsStyleSemiBold16(context).copyWith(
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
                style: AppStyles.interStyleRegular12(context).copyWith(
                  color: Colors.black,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                // profileCubit.logOut(context);
              },
              child: Text(
                'Log Out',
                style: AppStyles.interStyleRegular12(context).copyWith(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
