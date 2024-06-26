import 'package:climb_up/features/home/presention/views/widgets/custom_app_bar.dart';
import 'package:climb_up/features/home/presention/views/widgets/material_view.dart';
import 'package:climb_up/features/home/presention/views/widgets/product_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          const CustomAppBar(),
        ],
        body: const TabBarView(
          children: [
            MaterialView(),
            ProductView(),
          ],
        ),
      ),
    );
  }
}
