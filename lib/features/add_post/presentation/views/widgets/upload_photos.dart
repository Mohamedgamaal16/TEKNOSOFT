import 'package:climb_up/core/extensions/sepretator.dart';
import 'package:climb_up/core/utils/app_styles.dart';
import 'package:climb_up/features/add_post/presentation/views/widgets/add_photo.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadPhotos extends StatefulWidget {
  const UploadPhotos({super.key});

  @override
  State<UploadPhotos> createState() => _UploadPhotosState();
}

class _UploadPhotosState extends State<UploadPhotos> {
  XFile? test1, test2, test3, test4;
  late List<XFile?> photos = [
    test1,
    test2,
    test3,
    test4,
  ];

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
          children: List.generate(
            photos.length,
            (index) => GestureDetector(
              onTap: () async {
                await ImagePicker()
                    .pickImage(source: ImageSource.gallery)
                    .then((value) {
                  return photos[index] = value;
                });
                setState(() {});
              },
              child: AddPhoto(
                test: photos[index],
              ),
            ),
          )
              .seperator(const SizedBox(
                width: 16,
              ))
              .toList(),
        ),
        // Row(
        //   children: [
        //     GestureDetector(
        //         onTap: () {
        //           ImagePicker()
        //               .pickImage(source: ImageSource.gallery)
        //               .then((value) => test1 = value);
        //         },
        //         child: AddPhoto(
        //           test: test1,
        //         )),
        //     const SizedBox(
        //       width: 16,
        //     ),
        //     GestureDetector(
        //         onTap: () {
        //           ImagePicker()
        //               .pickImage(source: ImageSource.gallery)
        //               .then((value) => test2 = value);
        //         },
        //         child: AddPhoto(
        //           test: test2,
        //         )),
        //     const SizedBox(
        //       width: 16,
        //     ),
        //     GestureDetector(
        //         onTap: () {
        //           ImagePicker()
        //               .pickImage(source: ImageSource.gallery)
        //               .then((value) => test3 = value);
        //         },
        //         child: AddPhoto(
        //           test: test3,
        //         )),
        //     const SizedBox(
        //       width: 16,
        //     ),
        //     GestureDetector(
        //         onTap: () {
        //           ImagePicker()
        //               .pickImage(source: ImageSource.gallery)
        //               .then((value) => test4 = value);
        //         },
        //         child: AddPhoto(
        //           test: test4,
        //         )),
        //   ],
        // ),
        const SizedBox(
          height: 24,
        ),
      ],
    );
  }
}
