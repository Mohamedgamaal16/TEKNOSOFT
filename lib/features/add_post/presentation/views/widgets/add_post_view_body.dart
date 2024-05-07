import 'package:climb_up/core/utils/app_styles.dart';
import 'package:climb_up/core/widgets/custom_input_field.dart';
import 'package:climb_up/features/add_post/presentation/views/widgets/submit_buttons.dart';
import 'package:climb_up/features/add_post/presentation/views/widgets/upload_photos.dart';
import 'package:flutter/material.dart';

class AddPostViewBody extends StatelessWidget {
  const AddPostViewBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox.expand(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Create Post',
                    textAlign: TextAlign.center,
                    style: AppStyles.poppinsStyleSemiBold16(context).copyWith(
                      color: Colors.black,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 32, bottom: 16),
                    child: CustomInputField(
                      hintText: 'write Address Name',
                      labelText: 'Address Name',
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: CustomInputField(
                      labelText: 'Description',
                      hintText: 'write post description',
                      minLines: 5,
                      maxLines: 10,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: CustomInputField(
                      labelText: 'Price',
                      hintText: 'write product price',
                    ),
                  ),
                  const UploadPhotos(),
                ],
              ),
            ),
          ),
        ),
        Container(
          color: const Color(0xffFFFBFE),
          child: const SubmitButtons(),
        ),
      ],
    );
  }
}
