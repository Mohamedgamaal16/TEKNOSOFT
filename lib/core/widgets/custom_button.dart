import 'package:climb_up/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.color,
    required this.labelName,
    required this.textColor,
    this.onPressed,
    this.haveBorder = false,
  }) : super(key: key);

  final Color color, textColor;
  final String labelName;
  final void Function()? onPressed;
  final bool haveBorder;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: haveBorder
                ? const BorderSide(color: Colors.white) // Set border color to white
                : BorderSide.none, // No border
          ),
          elevation: 0,
          backgroundColor: color,
        ),
        onPressed: onPressed,
        child: Text(
          labelName,
          style: AppStyles.poppinsStyleSemiBold16(context).copyWith(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
