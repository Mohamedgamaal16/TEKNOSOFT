import 'package:climb_up/core/utils/app_styles.dart';
import 'package:climb_up/features/add_post/widgets/add_photo.dart';
import 'package:flutter/material.dart';

class UploadPhotos extends StatelessWidget {
  const UploadPhotos({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Upload Photos',
          style: AppStyles.poppinsStyleMedium12(context).copyWith(
            color: Colors.grey,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 40,
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              return const AddPhoto();
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 16,
              );
            },
          ),
        ),
        const SizedBox(
          height: 24,
        ),
      ],
    );
  }
}
