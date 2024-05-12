import 'package:climb_up/core/api/dio_consumer.dart';
import 'package:climb_up/features/add_post/data/repo/add_product_repo_imp.dart';
import 'package:climb_up/features/add_post/presentation/view_models/cubit/add_product_cubit.dart';
import 'package:climb_up/features/add_post/presentation/views/add_post_view.dart';
import 'package:climb_up/features/cart/data/repos/cart_repo_imp.dart';
import 'package:climb_up/features/cart/presention/view_models/fetch_cart_products_cubit/fetch_cart_products_cubit.dart';
import 'package:climb_up/features/cart/presention/view_models/payment_cubit/payment_cubit.dart';
import 'package:climb_up/features/cart/presention/views/cart_view.dart';
import 'package:climb_up/features/home/data/repos/home_repo_impl.dart';
import 'package:climb_up/features/home/presention/view_models/addproduct_to_cart_cubit/addproduct_to_cart_cubit.dart';
import 'package:climb_up/features/home/presention/view_models/fetch_product_data_cubit/fetch_product_data_cubit.dart';
import 'package:climb_up/features/home/presention/views/widgets/home_view_body.dart';
import 'package:climb_up/features/profile/data/repos/profile_repo_impl.dart';
import 'package:climb_up/features/profile/presentation/view_models/get_user_data_cubit/get_user_data_cubit.dart';
import 'package:climb_up/features/profile/presentation/view_models/upload_pic/upload_pic_cubit.dart';
import 'package:climb_up/features/profile/presentation/views/profile_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  int currentIndex = 0;
  final List<Widget> appPages = [
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FetchProductDataCubit(HomeRepoImpl(api: DioConsumer(dio: Dio())))
                ..fetchProductsData(),
        ),
        // BlocProvider(
        //   create: (context) =>
        //       AddproductToCartCubit(HomeRepoImpl(api: DioConsumer(dio: Dio()))),
        // ),
      ],
      child: const HomeViewBody(),
    ),
    BlocProvider(
      create: (context) =>
          AddProductCubit(AddProductRepoImp(api: DioConsumer(dio: Dio()))),
      child: const AddPostView(),
    ),
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              PaymentCubit(CartRepoImp(api: DioConsumer(dio: Dio()))),
        ),
        BlocProvider(
          create: (context) => FetchCartProductsCubit(CartRepoImp(api: DioConsumer(dio: Dio())))..fetchCartProducts(),
        ),
      ],
      child: const CartView(),
    ),
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UploadPicCubit(),
        ),
        BlocProvider(
          create: (context) =>
              GetUserDataCubit(ProfileRepoImpl(api: DioConsumer(dio: Dio())))
                ..fetchUserData(),
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
