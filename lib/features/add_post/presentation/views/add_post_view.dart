import 'package:climb_up/features/add_post/presentation/views/widgets/add_post_view_body.dart';

import 'package:flutter/material.dart';

class AddPostView extends StatelessWidget {
  const AddPostView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: AddPostViewBody()),
    );
  }
}
