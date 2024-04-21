import 'package:climb_up/core/utils/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ClimbUpApp());
}

class ClimbUpApp extends StatelessWidget {
  const ClimbUpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      routerConfig: AppRouter.router,
            debugShowCheckedModeBanner: false,

    );
  }
}
