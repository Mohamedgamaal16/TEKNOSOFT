import 'package:climb_up/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreatePostAppBar extends StatelessWidget {
  const CreatePostAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return 
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Create Post',
              textAlign: TextAlign.center,
              style: AppStyles.poppinsStyleSemiBold16(context).copyWith(
                color: Colors.black,
              ),
            ),
          ],
        );
  }
}
