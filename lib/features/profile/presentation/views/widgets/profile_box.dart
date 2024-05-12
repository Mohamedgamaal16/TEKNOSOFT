import 'dart:io';

import 'package:climb_up/core/utils/app_styles.dart';
import 'package:climb_up/features/add_post/presentation/view_models/cubit/add_product_cubit.dart';
import 'package:climb_up/features/profile/presentation/view_models/get_user_data_cubit/get_user_data_cubit.dart';
import 'package:climb_up/features/profile/presentation/view_models/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ProfileBox extends StatelessWidget {
  const ProfileBox({
    super.key,
  });

  static XFile? gemy;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserDataCubit, GetUserDataState>(
        builder: (context, state) {
      ProfileCubit profileCubit = BlocProvider.of(context);
      if (state is GetUserDataSuccess) {
        return Row(
          children: [
            SizedBox(
                width: 130,
                height: 130,
                child: gemy == null
                    ? CircleAvatar(
                        backgroundColor: Colors.grey.shade200,
                        backgroundImage:
                            const AssetImage("assets/images/avatar.png"),
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 5,
                              right: 5,
                              child: GestureDetector(
                                onTap: () async {
                                  ImagePicker()
                                      .pickImage(source: ImageSource.gallery)
                                      .then((value) => gemy = value);
                                },
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.blue.shade400,
                                    border: Border.all(
                                        color: Colors.white, width: 3),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: const Icon(
                                    Icons.camera_alt_sharp,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : CircleAvatar(
                        backgroundImage: FileImage(File(gemy!.path)),
                      )),
            const SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.userModel.data.user.name,
                  style: AppStyles.interStyleBold12(context).copyWith(
                    fontSize: 14,
                  ),
                ),
                Text(
                  state.userModel.data.user.email,
                  style: AppStyles.interStyleRegular12(context),
                )
              ],
            )
          ],
        );
      } else {
        return const Text('');
      }
    });
  }
}
