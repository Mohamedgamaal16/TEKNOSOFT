import 'package:climb_up/core/widgets/custom_button.dart';
import 'package:climb_up/core/widgets/custom_input_field.dart';
import 'package:climb_up/features/profile/presentation/widgets/change_password_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChangePasswordViewBody extends StatelessWidget {
  const ChangePasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        children: [
          const ChangePasswordAppBar(),
          const SizedBox(
            height: 24,
          ),
          const CustomInputField(
            suffixIcon: true,
            obscureText: true,
            labelText: 'Current Password',
            hintText: 'Enter your current password',
          ),
          const SizedBox(
            height: 16,
          ),
          const CustomInputField(
            obscureText: true,
            suffixIcon: true,
            labelText: 'New Password',
            hintText: 'Enter a new password',
          ),
          const SizedBox(
            height: 16,
          ),
          const CustomInputField(
            obscureText: true,
            suffixIcon: true,
            labelText: 'Confirm Password',
            hintText: 'Confrim your new password',
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  labelName: 'Change Password',
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
