import 'package:climb_up/core/utils/app_styles.dart';
import 'package:climb_up/core/utils/constants.dart';
import 'package:climb_up/features/home/presention/widgets/custom_app_bar.dart';
import 'package:climb_up/features/home/presention/widgets/material_view.dart';
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
            const CustomAppBar(),
          ],
          body: const TabBarView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal:16.0),
                child: MaterialView(),
              ),
              Text('data'),
            ],
          ),
        ),
      ),
    );
  }
}
