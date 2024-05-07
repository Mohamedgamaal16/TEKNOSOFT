// import 'dart:js';

import 'package:climb_up/core/utils/app_router.dart';
import 'package:climb_up/core/utils/service_locator.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetInstance.registerInstances();
  runApp(const ClimbUpApp()

      // DevicePreview(builder: (context)=> const ClimbUpApp(),)
      );
}

class ClimbUpApp extends StatelessWidget {
  const ClimbUpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
