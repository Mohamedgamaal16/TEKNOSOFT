import 'package:climb_up/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.color, required this.labeName, this.onPressed});
  final Color color;
  final String labeName;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 0,
          backgroundColor: color,
        ),
        onPressed: onPressed,
        child: Text(
          labeName,
          style: AppStyles.poppinsStyleSemiBold16(context)
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
