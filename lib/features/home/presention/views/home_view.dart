import 'package:climb_up/core/widgets/bottom_nav_bar.dart';
import 'package:climb_up/features/home/presention/view_models/home_cubit/home_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: homeCubit.appPages[homeCubit.currentIndex],
            ),
          ),
          bottomNavigationBar: CustomBottomNavBar(
            changePages: homeCubit.changePages,
            cureentIndex: homeCubit.currentIndex,
          ),
        );
      },
    );
  }
}
