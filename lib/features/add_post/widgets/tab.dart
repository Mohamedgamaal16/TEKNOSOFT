import 'package:climb_up/core/utils/app_styles.dart';
import 'package:climb_up/core/utils/constants.dart';
import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {
  const TabButton({
    super.key,
    required this.isSelected,
    required this.title,
    required this.onTap,
  });
  final String title;
  final bool isSelected;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30,
        width: double.infinity,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.kPrimaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(
            16,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: AppStyles.poppinsStyleSemiBold16(context).copyWith(
              color: isSelected ? Colors.white : AppColors.kPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
