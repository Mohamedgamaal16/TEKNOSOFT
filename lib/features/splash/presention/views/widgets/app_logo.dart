import 'package:climb_up/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    required bool isVisible,
  }) : _isVisible = isVisible;

  final bool _isVisible;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 1500),
        opacity: _isVisible ? 1 : 0,
        child: Column(
          children: [
            Image.asset('assets/images/logo.png'),
            const SizedBox(
              height: 45,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Everything you need for your brand is here',
                textAlign: TextAlign.center,
                style: AppStyles.poppinsStyleRegular14(context)
                    .copyWith(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
    );
  }
}
