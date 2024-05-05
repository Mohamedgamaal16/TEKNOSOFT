import 'package:climb_up/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class AddPhoto extends StatelessWidget {
  const AddPhoto({super.key, });
 static  bool isSelectd =false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
        ),
        child: isSelectd
            ? Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVmc7QfynlVKZwz4yWRi5lvLWkfsMnJxG1ncrQPLGYXg&s',
                fit: BoxFit.fill,
              )
            : const Icon(
                FontAwesomeIcons.plus,
                size: 14,
              ),
      ),
      onTap: () {
        ImagePicker().pickImage(source: ImageSource.gallery);
        isSelectd=true;
      },
    );
  }
}
