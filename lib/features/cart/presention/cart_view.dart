import 'package:climb_up/core/utils/app_styles.dart';
import 'package:climb_up/features/cart/presention/widgets/cart_view_body.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        
        body: SafeArea(child: CartViewBody()));
  }
}
