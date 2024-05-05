import 'dart:io';

import 'package:climb_up/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class AddPhoto extends StatelessWidget {
  const AddPhoto({
    super.key,this.test
  });
  static bool isSelectd = false;
  final XFile? test;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
          ),
          child: test == null
              ? const Icon(
                  FontAwesomeIcons.plus,
                  size: 14,
                )
              : CircleAvatar(
                  backgroundImage: FileImage(File(test!.path)),
                )),
     
    );
  }
}
