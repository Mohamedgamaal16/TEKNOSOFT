// import 'package:climb_up/core/utils/app_styles.dart';
// import 'package:climb_up/core/utils/constants.dart';
// import 'package:climb_up/core/widgets/custom_button.dart';
import 'package:climb_up/core/api/dio_consumer.dart';
import 'package:climb_up/features/home/data/repos/home_repo_impl.dart';
import 'package:climb_up/features/home/presention/view_models/addproduct_to_cart_cubit/addproduct_to_cart_cubit.dart';
import 'package:climb_up/features/home/presention/views/widgets/product_detailes_data.dart';
import 'package:climb_up/features/home/presention/views/widgets/product_footer.dart';
import 'package:climb_up/features/home/presention/views/widgets/scrollable_pics.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class ProductDisplayBody extends StatelessWidget {
  const ProductDisplayBody({
    super.key,
    required this.pic,
    required this.rate,
    required this.price,
    required this.detailes,
    required this.title,
    required this.call,
    this.netWorkImage = false,
    required this.productId,
  });
  static String supportCallCenterNum = "01050566622";
  final List<String> pic;
  final String rate, price, detailes, title, productId;
  final bool call, netWorkImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          // bottom:0,
          child: AspectRatio(
            aspectRatio: 700 / 500,
            child: ScrollablePics(
              smallerPaddingHeight: false,
              pics: pic,
              netWorkImage: netWorkImage,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          top: MediaQuery.of(context).size.height * .336,
          left: 0,
          right: 0,
          child: TextInContainer(
            rate: rate,
            price: price,
            detailes: detailes,
            title: title,
          ),
        ),
        BlocProvider(
          create: (context) => AddproductToCartCubit(HomeRepoImpl(api: DioConsumer(dio: Dio()))),
          child: ProductFooter(
            price: price,
            call: call,
            supportCallCenterNum: supportCallCenterNum,
            productId: productId,
          ),
        )
      ],
    );
  }
}
