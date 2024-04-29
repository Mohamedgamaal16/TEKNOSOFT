import 'package:climb_up/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddPhoto extends StatelessWidget {
  const AddPhoto({super.key, this.isSelectd = false});
  final bool isSelectd;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isSelectd ? AppColors.kPrimaryColor : Colors.grey,
          width: 1,
        ),
      ),
      child: const Icon(
        FontAwesomeIcons.plus,
        size: 14,
      ),
    );
  }
}
