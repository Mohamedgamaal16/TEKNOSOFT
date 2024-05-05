import 'package:climb_up/core/utils/app_styles.dart';
import 'package:climb_up/features/add_post/widgets/add_photo.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadPhotos extends StatelessWidget {
  const UploadPhotos({super.key});
  static XFile? test1,test2,test3,test4;
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
        Row(
          children: [
            GestureDetector(
                onTap: () {
                  ImagePicker()
                      .pickImage(source: ImageSource.gallery)
                      .then((value) => test1 = value);
                },
                child: AddPhoto(
                  test: test1,
                )),
            const SizedBox(
              width: 16,
            ),
            GestureDetector(
                onTap: () {
                  ImagePicker()
                      .pickImage(source: ImageSource.gallery)
                      .then((value) => test2 = value);
                },
                child:  AddPhoto( test: test2,)),
            const SizedBox(
              width: 16,
            ),
            GestureDetector(
                onTap: () {
                  ImagePicker()
                      .pickImage(source: ImageSource.gallery)
                      .then((value) => test3 = value);
                },
                child:  AddPhoto( test: test3,)),
            const SizedBox(
              width: 16,
            ),
            GestureDetector(
                onTap: () {
                  ImagePicker()
                      .pickImage(source: ImageSource.gallery)
                      .then((value) => test4 = value);
                },
                child:  AddPhoto( test: test4,)),
          ],
        ),
        const SizedBox(
          height: 24,
        ),
      ],
    );
  }
}
