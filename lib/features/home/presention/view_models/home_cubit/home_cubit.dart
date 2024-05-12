import 'package:climb_up/core/api/dio_consumer.dart';
import 'package:climb_up/features/add_post/data/repo/add_product_repo.dart';
import 'package:climb_up/features/add_post/data/repo/add_product_repo_imp.dart';
import 'package:climb_up/features/add_post/presentation/view_models/cubit/add_product_cubit.dart';
import 'package:climb_up/features/add_post/presentation/views/add_post_view.dart';
import 'package:climb_up/features/cart/data/repos/cart_repo_imp.dart';
import 'package:climb_up/features/cart/presention/view_models/payment_cubit/payment_cubit.dart';
import 'package:climb_up/features/cart/presention/views/cart_view.dart';
import 'package:climb_up/features/home/data/repos/home_repo_impl.dart';
import 'package:climb_up/features/home/presention/views/widgets/home_view_body.dart';
import 'package:climb_up/features/profile/data/repos/profile_repo_impl.dart';
import 'package:climb_up/features/profile/presentation/view_models/get_user_data_cubit/get_user_data_cubit.dart';
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
    BlocProvider(
      create: (context) =>
          AddProductCubit(AddProductRepoImp(api: DioConsumer(dio: Dio()))),
      child: const AddPostView(),
    ),
    BlocProvider(
      create: (context) =>
          PaymentCubit(CartRepoImp(api: DioConsumer(dio: Dio()))),
      child: const CartView(),
    ),
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProfileCubit()..loadData(),
        ),
        BlocProvider(
          create: (context) =>
              GetUserDataCubit(ProfileRepoImpl(api: DioConsumer(dio: Dio())))..fetchUserData(),
        ),
      ],
      child: const ProfileView(),
    ),
  ];
  void changePages(int value) {
    currentIndex = value;
    emit(PageChanged());
  }
}
