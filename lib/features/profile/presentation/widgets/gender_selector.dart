import 'package:climb_up/core/utils/app_styles.dart';
import 'package:climb_up/core/utils/constants.dart';
import 'package:flutter/material.dart';

class GenderSelector extends StatefulWidget {
  const GenderSelector({super.key});

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  static const List<String> genders = [
    'Male',
    'Female',
  ];
  String selectedGender = genders[0];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: genders.length,
        itemBuilder: (context, index) {
          return RadioListTile(
            title: Text(
              genders[index],
              style: AppStyles.interStyleRegular12(context),
            ),
            fillColor: MaterialStateColor.resolveWith(
              (states) => AppColors.kPrimaryColor,
            ),
            value: genders[index],
            groupValue: selectedGender,
            onChanged: (String? value) {
              setState(() {
                selectedGender = value!;
              });
            },
          );
        },
      ),
    );
  }
}
