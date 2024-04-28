import 'package:climb_up/features/add_post/widgets/tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CreatePostTabBar extends StatefulWidget {
  const CreatePostTabBar({super.key});

  @override
  State<CreatePostTabBar> createState() => _CreatePostTabBarState();
}

class _CreatePostTabBarState extends State<CreatePostTabBar> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TabButton(
                onTap: () {
                  setState(() {
                    _currentIndex = 0;
                  });
                },
                isSelected: _currentIndex == 0 ? true : false,
                title: 'Material',
              ),
            ),
            Expanded(
              child: TabButton(
                onTap: () {
                  setState(() {
                    _currentIndex = 1;
                  });
                },
                isSelected: _currentIndex == 1 ? true : false,
                title: 'Gallery',
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 24,
        ),
      ],
    );
  }
}
