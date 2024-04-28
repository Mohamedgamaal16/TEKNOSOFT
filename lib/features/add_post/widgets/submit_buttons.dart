import 'package:climb_up/core/utils/app_styles.dart';
import 'package:climb_up/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class SubmitButtons extends StatelessWidget {
  const SubmitButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        children: [
          Text(
            'Clear',
            style: AppStyles.poppinsStyleSemiBold16(context).copyWith(
              color: Colors.black,
              decoration: TextDecoration.underline,
            ),
          ),
          const Spacer(),
          const CustomButton(
            borderRadius: 8,
           
            labelName: 'Create',
          )
        ],
      ),
    );
  }
}
