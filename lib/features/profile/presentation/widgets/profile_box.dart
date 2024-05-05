import 'package:climb_up/core/utils/app_styles.dart';
import 'package:climb_up/features/profile/data/models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileBox extends StatelessWidget {
  const ProfileBox({super.key, required this.profileModel});
  final ProfileModel profileModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            width: 130,
            height: 130,
            child: CircleAvatar(
              backgroundColor: Colors.grey.shade200,
              backgroundImage: const AssetImage("assets/images/avatar.png"),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: GestureDetector(
                      onTap: () async {
                        ImagePicker().pickImage(source: ImageSource.gallery);
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade400,
                          border: Border.all(color: Colors.white, width: 3),
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
            )),
        const SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              profileModel.name,
              style: AppStyles.interStyleBold12(context).copyWith(
                fontSize: 14,
              ),
            ),
            Text(
              profileModel.userName,
              style: AppStyles.interStyleRegular12(context),
            )
          ],
        )
      ],
    );
  }
}
