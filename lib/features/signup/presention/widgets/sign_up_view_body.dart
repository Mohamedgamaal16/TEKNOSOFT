import 'package:climb_up/core/utils/app_router.dart';
import 'package:climb_up/core/utils/app_styles.dart';
import 'package:climb_up/core/utils/constants.dart';
import 'package:climb_up/core/widgets/custom_button.dart';
import 'package:climb_up/core/widgets/custom_input_field.dart';
import 'package:climb_up/core/widgets/custom_sign_footer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 35,
            ),
            Text(
              'Get started',
              style: AppStyles.poppinsStyleBold24(context),
            ),
            const SizedBox(
              height: 100,
            ),
            const CustomInputField(
              labelText: 'User Name',
              hintText: 'Enter your User Name',
            ),
            const SizedBox(
              height: 16,
            ),
            const CustomInputField(
              labelText: 'Email Address',
              hintText: 'Enter your email',
            ),
            const SizedBox(
              height: 16,
            ),
            const CustomInputField(
              labelText: 'Password',
              hintText: "Enter your password",
              obscureText: true,
              suffixIcon: true,
            ),
            const SizedBox(
              height: 16,
            ),
            const CustomInputField(
              labelText: 'Confirm Password',
              hintText: "Confirm your password",
              obscureText: true,
              suffixIcon: true,
            ),
            const SizedBox(
              height: 11,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 1,
              child: Text(
                'Forgot password?',
                style: AppStyles.poppinsStyleBold14(context),
                textAlign: TextAlign.end,
              ),
            ),
            const SizedBox(
              height: 27,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    color: AppColors.kPrimaryColor,
                    labelName: 'Sign Up',
                    textColor: Colors.white,
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.kBottomNavBar);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            CustomSignFooter(
              pageName: 'Log In',
              onTap: () {
                GoRouter.of(context).push(AppRouter.kLogInView);
              },
              sentence: "already have an account",
            )
          ],
        ),
      ),
    );
  }
}
