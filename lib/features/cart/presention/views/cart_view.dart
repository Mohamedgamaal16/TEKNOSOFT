import 'package:climb_up/core/api/dio_consumer.dart';
import 'package:climb_up/features/cart/data/repos/catr_repo_imp.dart';
import 'package:climb_up/features/cart/presention/view_models/payment_cubit/payment_cubit.dart';
import 'package:climb_up/features/cart/presention/views/widgets/cart_view_body.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: BlocProvider(
      create: (context) =>
          PaymentCubit(CartREpoImp(api: DioConsumer(dio: Dio())))..payWithPayMob(totalPrice: 250),
      child: const CartViewBody(),
    )));
  }
}
