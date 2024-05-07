import 'package:climb_up/core/utils/app_styles.dart';
import 'package:climb_up/core/utils/constants.dart';
import 'package:climb_up/features/profile/presentation/view_models/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderSelector extends StatefulWidget {
  const GenderSelector({super.key});

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        ProfileCubit profileCubit = ProfileCubit.get(context);
        return Padding(
          padding: const EdgeInsets.only(
            top: 10,
          ),
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: profileCubit.genders.length,
            itemBuilder: (context, index) {
              return RadioListTile(
                title: Text(
                  profileCubit.genders[index],
                  style: AppStyles.interStyleRegular12(context),
                ),
                fillColor: MaterialStateColor.resolveWith(
                  (states) => AppColors.kPrimaryColor,
                ),
                value: profileCubit.genders[index],
                groupValue: profileCubit.profileModel.gender,
                onChanged: (String? value) {
                  setState(() {
                    // selectedGender = value!;

                    profileCubit.setGender(index);
                  });
                },
              );
            },
          ),
        );
      },
    );
  }
}
