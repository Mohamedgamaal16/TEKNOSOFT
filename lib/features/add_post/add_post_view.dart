import 'package:climb_up/features/add_post/widgets/create_post_app_bar.dart';
import 'package:climb_up/features/add_post/widgets/input_field.dart';
import 'package:climb_up/features/add_post/widgets/submit_buttons.dart';
import 'package:climb_up/features/add_post/widgets/tab_bar.dart';
import 'package:climb_up/features/add_post/widgets/upload_photos.dart';
import 'package:flutter/material.dart';

class AddPostView extends StatelessWidget {
  const AddPostView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              child: Scaffold(
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    CreatePostAppBar(),
                    CreatePostTabBar(),
                    CreatePostInputField(
                      label: 'Address Name',
                    ),
                    CreatePostInputField(
                      label: 'Descripition',
                      minLines: 5,
                    ),
                    CreatePostInputField(
                      label: 'Price',
                    ),
                    UploadPhotos(),
                    Divider(
                      color: Colors.grey,
                    ),
                    SubmitButtons(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
