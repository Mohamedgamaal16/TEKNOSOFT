import 'package:climb_up/core/utils/app_styles.dart';
import 'package:climb_up/core/widgets/custom_button.dart';
import 'package:climb_up/core/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';

class ChangePasswordViewBody extends StatelessWidget {
  const ChangePasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(slivers: [
        SliverFillRemaining(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Change password',
                style: AppStyles.poppinsStyleBold24(context),
              ),
              const SizedBox(height: 50),
              const CustomInputField(
                suffixIcon: true,
                obscureText: true,
                labelText: 'Current Password',
                hintText: 'Enter your current password',
              ),
              const SizedBox(height: 16),
              const CustomInputField(
                obscureText: true,
                suffixIcon: true,
                labelText: 'New Password',
                hintText: 'Enter a new password',
              ),
              const SizedBox(height: 16),
              const CustomInputField(
                obscureText: true,
                suffixIcon: true,
                labelText: 'Confirm Password',
                hintText: 'Confirm your new password',
              ),
              const SizedBox(height: 16),
              CustomButton(
                labelName: 'Change Password',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
