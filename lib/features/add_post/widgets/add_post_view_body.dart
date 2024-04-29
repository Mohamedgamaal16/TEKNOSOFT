import 'package:climb_up/core/widgets/custom_input_field.dart';
import 'package:climb_up/features/add_post/widgets/create_post_app_bar.dart';
import 'package:climb_up/features/add_post/widgets/submit_buttons.dart';
import 'package:climb_up/features/add_post/widgets/upload_photos.dart';
import 'package:flutter/material.dart';

class AddPostViewBody extends StatelessWidget {
  const AddPostViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: Spacer()),
        SliverToBoxAdapter(child: CreatePostAppBar()),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 32,
          ),
        ),
        SliverToBoxAdapter(
          child: CustomInputField(
            hintText: 'write Address Name',
            labelText: 'Address Name',
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 16,
          ),
        ),
        SliverToBoxAdapter(
          child: CustomInputField(
            labelText: 'Description',
            hintText: 'write post description',
            minLines: 5,
            maxLines: 10,
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 16,
          ),
        ),
        SliverToBoxAdapter(
          child: CustomInputField(
            labelText: 'Price',
            hintText: 'write product price',
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 16,
          ),
        ),
        SliverToBoxAdapter(child: UploadPhotos()),
        SliverToBoxAdapter(
          child: Divider(
            color: Colors.grey,
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(child: SubmitButtons())),
      ],
    );
  }
}
