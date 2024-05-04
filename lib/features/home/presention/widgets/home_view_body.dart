import 'package:climb_up/features/home/presention/widgets/custom_app_bar.dart';
import 'package:climb_up/features/home/presention/widgets/material_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: 
         NestedScrollView(
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
    
    );
  }
}
