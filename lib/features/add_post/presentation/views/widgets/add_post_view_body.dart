import 'package:climb_up/core/utils/app_styles.dart';
import 'package:climb_up/core/widgets/custom_input_field.dart';
import 'package:climb_up/features/add_post/presentation/view_models/add_product_cubit/add_product_cubit.dart';
import 'package:climb_up/features/add_post/presentation/views/widgets/submit_buttons.dart';
import 'package:climb_up/features/add_post/presentation/views/widgets/upload_photos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                  Padding(
                    padding: const EdgeInsets.only(top: 32, bottom: 16),
                    child: CustomInputField(
                      hintText: 'write product Name',
                      labelText: 'product Name',
                      controller: context.read<AddProductCubit>().name,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: CustomInputField(
                        labelText: 'Description',
                        hintText: 'write post description',
                        minLines: 5,
                        maxLines: 10,
                        controller: context.read<AddProductCubit>().description),
                  ),
                   Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: CustomInputField(
                        labelText: 'Price',
                        hintText: 'write product price',
                        controller: context.read<AddProductCubit>().price),
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
