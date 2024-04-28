import 'package:climb_up/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CreatePostInputField extends StatelessWidget {
  const CreatePostInputField({
    super.key,
    this.minLines = 1,
    required this.label,
  });
  final int minLines;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        maxLines: 5,
        minLines: minLines,
        decoration: InputDecoration(
          enabledBorder: outline(),
          focusedBorder: outline(),
          disabledBorder: outline(),
          border: outline(),
          labelText: label,
          labelStyle: AppStyles.poppinsStyleMedium12(context).copyWith(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  OutlineInputBorder outline() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.grey,
      ),
      borderRadius: BorderRadius.circular(8),
    );
  }
}
