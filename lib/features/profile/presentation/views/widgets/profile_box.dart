import 'dart:io';

import 'package:climb_up/core/utils/app_styles.dart';
import 'package:climb_up/features/profile/presentation/view_models/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ProfileBox extends StatelessWidget {
  const ProfileBox({
    super.key,
  });

static XFile? test ; 
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
      ProfileCubit profileCubit = BlocProvider.of(context);
      return Row(
        children: [
          SizedBox(
              width: 130,
              height: 130,
              child: profileCubit.pic == null
                  ? UnUploadedPic(profileCubit: profileCubit)
                  : UplodaedPic(profileCubit: profileCubit)),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                profileCubit.profileModel.name,
                style: AppStyles.interStyleBold12(context).copyWith(
                  fontSize: 14,
                ),
              ),
              Text(
                profileCubit.profileModel.email,
                style: AppStyles.interStyleRegular12(context),
              )
            ],
          )
        ],
      );
    });
  }
}

class UnUploadedPic extends StatelessWidget {
  const UnUploadedPic({
    super.key,
    required this.profileCubit,
  });

  final ProfileCubit profileCubit;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar( 
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
                      .then((value) {profileCubit.uploadProfilePic(value!);
                      
                      });
                      
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade400,
                    border:
                        Border.all(color: Colors.white, width: 3),
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
      );
  }
}

class UplodaedPic extends StatelessWidget {
  const UplodaedPic({
    super.key,
    required this.profileCubit,
  });

  final ProfileCubit profileCubit;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        backgroundImage: FileImage(File(profileCubit.pic!.path)),
     child:  Stack(
          children: [
            Positioned(
              bottom: 5,
              right: 5,
              child: GestureDetector(
                onTap: () async {
                  ImagePicker()
                      .pickImage(source: ImageSource.gallery)
                      .then((value) {profileCubit.uploadProfilePic(value!);});
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade400,
                    border:
                        Border.all(color: Colors.white, width: 3),
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
        ), );
  }
}
