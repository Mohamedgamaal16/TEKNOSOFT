// ignore_for_file: prefer_const_constructors

import 'package:climb_up/core/utils/constants.dart';
import 'package:climb_up/core/widgets/custom_input_field.dart';
import 'package:climb_up/features/add_post/widgets/create_post_app_bar.dart';
import 'package:climb_up/features/add_post/widgets/submit_buttons.dart';
import 'package:climb_up/features/add_post/widgets/upload_photos.dart';
import 'package:flutter/material.dart';


// class AddPostViewBody extends StatelessWidget {
//   const AddPostViewBody({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Expanded(
//               child: CustomScrollView(
//                 shrinkWrap: true,
//                 slivers: const [
//                   SliverToBoxAdapter(child: CreatePostAppBar()),
//                   SliverPadding(
//                     padding: EdgeInsets.only(top: 32, bottom: 16),
//                     sliver: SliverToBoxAdapter(
//                       child: CustomInputField(
//                         hintText: 'write Address Name',
//                         labelText: 'Address Name',
//                       ),
//                     ),
//                   ),
//                   SliverPadding(
//                     padding: EdgeInsets.symmetric(vertical: 8),
//                     sliver: SliverToBoxAdapter(
//                       child: CustomInputField(
//                         labelText: 'Description',
//                         hintText: 'write post description',
//                         minLines: 5,
//                         maxLines: 10,
//                       ),
//                     ),
//                   ),
//                   SliverPadding(
//                     padding: EdgeInsets.symmetric(vertical: 8),
//                     sliver: SliverToBoxAdapter(
//                       child: CustomInputField(
//                         labelText: 'Price',
//                         hintText: 'write product price',
//                       ),
//                     ),
//                   ),
//                   SliverToBoxAdapter(child: UploadPhotos()),
//                   SliverToBoxAdapter(
//                     child: Divider(
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               color: Color(0xffFFFBFE),
//               child: SubmitButtons(),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }


// class AddPostViewBody extends StatelessWidget {
//   const AddPostViewBody({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: const [
//               CreatePostAppBar(),
//               Padding(
//                 padding: EdgeInsets.only(top: 32, bottom: 16),
//                 child: CustomInputField(
//                   hintText: 'write Address Name',
//                   labelText: 'Address Name',
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(vertical: 8),
//                 child: CustomInputField(
//                   labelText: 'Description',
//                   hintText: 'write post description',
//                   minLines: 5,
//                   maxLines: 10,
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(vertical: 8),
//                 child: CustomInputField(
//                   labelText: 'Price',
//                   hintText: 'write product price',
//                 ),
//               ),
//               UploadPhotos(),
//               Divider(
//                 color: Colors.grey,
//               ),
//             ],
//           ),
//         ),
//         Positioned(
//           bottom: 0,
//           left: 0,
//           right: 0,
//           child: Container(
//             color: const Color(0xffFFFBFE),
//             child: SubmitButtons(),
//           ),
//         ),
//       ],
//     );
//   }
// }
class AddPostViewBody extends StatelessWidget {
  const AddPostViewBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox.expand(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom:50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  CreatePostAppBar(),
                  Padding(
                    padding: EdgeInsets.only(top: 32, bottom: 16),
                    child: CustomInputField(
                      hintText: 'write Address Name',
                      labelText: 'Address Name',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: CustomInputField(
                      labelText: 'Description',
                      hintText: 'write post description',
                      minLines: 5,
                      maxLines: 10,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: CustomInputField(
                      labelText: 'Price',
                      hintText: 'write product price',
                    ),
                  ),
                  UploadPhotos(),
                  
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            color: const Color(0xffFFFBFE),
            child: SubmitButtons(),
          ),
        ),
      ],
    );
  }
}
