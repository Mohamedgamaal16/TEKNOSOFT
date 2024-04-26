import 'package:climb_up/core/utils/app_styles.dart';
import 'package:climb_up/core/utils/constants.dart';
import 'package:climb_up/icons.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              pinned: true,
              floating: true,
              snap: true,
              leadingWidth: 20,
              leading: const Icon(
                Icons.emoji_people,
                size: 1,
              ),
              title: Text(
                'Climb Up',
                style: AppStyles.poppinsStyleBold24(context),
              ),
              bottom: const TabBar(
                indicatorColor: AppColors.kPrimaryColor,
                indicatorWeight: 5,
                labelColor: AppColors.kPrimaryColor,
                tabs: [
                  Tab(
                    icon: Icon(
                      MyFlutterApp.simple_icons_materialformkdocs,
                      size: 30,
                    ),
                    text: 'Material',
                  ),
                  Tab(
                    icon: Icon(
                      MyFlutterApp.solar_gallery_broken,
                      size: 30,
                    ),
                    text: 'Gallery',
                  )
                ],
              ),
            )
          ],
          body: const TabBarView(
            children: [
              Text('hi'),
              Text('data'),
            ],
          ),
        ),
      ),
    );
  }
}
