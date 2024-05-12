import 'package:climb_up/core/utils/app_styles.dart';
import 'package:climb_up/features/add_post/presentation/view_models/cubit/add_product_cubit.dart';
import 'package:climb_up/features/add_post/presentation/views/widgets/add_photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class UploadPhotos extends StatelessWidget {
  const UploadPhotos({super.key});

  // XFile? test1;
  //  test2, test3, test4;

  // late List<XFile?> photos = [
  //   test1,
  //   test2,
  //   test3,
  //   test4,
  // ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddProductCubit, AddProductState>(
      builder: (context, state) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  ImagePicker().pickImage(source: ImageSource.gallery).then(
                      (value) => context
                          .read<AddProductCubit>()
                          .uploadProfilePic(value!));
                },
                child: AddPhoto(
                    test: context.read<AddProductCubit>().pic == null
                        ? null
                        : context.read<AddProductCubit>().pic),
              ),
              const SizedBox(
                width: 16,
              ),
              GestureDetector(
                  onTap: () {
                    ImagePicker().pickImage(source: ImageSource.gallery).then(
                        (value) => context
                            .read<AddProductCubit>()
                            .uploadProfilePic(value!));
                  },
                  child: AddPhoto(
                    test: context.read<AddProductCubit>().pic,
                  )),
              const SizedBox(
                width: 16,
              ),
              GestureDetector(
                  onTap: () {
                    ImagePicker().pickImage(source: ImageSource.gallery).then(
                        (value) => context
                            .read<AddProductCubit>()
                            .uploadProfilePic(value!));
                  },
                  child: AddPhoto(
                    test: context.read<AddProductCubit>().pic,
                  )),
              const SizedBox(
                width: 16,
              ),
              GestureDetector(
                  onTap: () {
                    ImagePicker().pickImage(source: ImageSource.gallery).then(
                        (value) => context
                            .read<AddProductCubit>()
                            .uploadProfilePic(value!));
                  },
                  child: AddPhoto(
                    test: context.read<AddProductCubit>().pic,
                  )),
            ],
          )
        ]);
      },
    );
    // const SizedBox(
    //   height: 24,
    //   ),
    // ],
    // );
  }
}



// Row(
        //   children: List.generate(
        //     photos.length,
        //     (index) => GestureDetector(
        //       onTap: () async {
        //         await ImagePicker()
        //             .pickImage(source: ImageSource.gallery)
        //             .then((value) {
        //           return photos[index] = value;
        //         });
        //         setState(() {});
        //       },
        //       child: AddPhoto(
        //         test: photos[index],
        //       ),
        //     ),
        //   )
        //       .seperator(const SizedBox(
        //         width: 16,
        //       ))
        //       .toList(),
        // ),