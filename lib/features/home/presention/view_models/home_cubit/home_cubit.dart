import 'package:climb_up/core/api/dio_consumer.dart';
import 'package:climb_up/features/add_post/presentation/views/add_post_view.dart';
import 'package:climb_up/features/cart/data/repos/cart_repo_imp.dart';
import 'package:climb_up/features/cart/presention/view_models/payment_cubit/payment_cubit.dart';
import 'package:climb_up/features/cart/presention/views/cart_view.dart';
import 'package:climb_up/features/home/data/repos/home_repo_impl.dart';
import 'package:climb_up/features/home/presention/views/widgets/home_view_body.dart';
import 'package:climb_up/features/profile/presentation/view_models/profile_cubit/profile_cubit.dart';
import 'package:climb_up/features/profile/presentation/views/profile_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  int currentIndex = 0;
  final List<Widget> appPages = [
    const HomeViewBody(),
    const AddPostView(),
    BlocProvider(
      create: (context) => PaymentCubit(CartRepoImp(api: DioConsumer(dio: Dio()))),
      child: const CartView(),
    ),
    BlocProvider(
      create: (context) => ProfileCubit()..loadData(),
      child: const ProfileView(),
    ),
  ];
  void changePages(int value) {
    currentIndex = value;
    emit(PageChanged());
  }
}
