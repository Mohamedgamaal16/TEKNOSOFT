import 'package:climb_up/features/home/presention/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const  SafeArea(
        child: Scaffold(body: HomeViewBody()),
      
    );
  }
}
