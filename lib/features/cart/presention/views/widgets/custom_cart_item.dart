import 'package:climb_up/core/api/dio_consumer.dart';
import 'package:climb_up/core/utils/app_styles.dart';
import 'package:climb_up/features/cart/data/repos/cart_repo_imp.dart';
import 'package:climb_up/features/cart/presention/view_models/remove_from_cart_cubit/remove_from_cart_cubit.dart';
import 'package:climb_up/features/cart/presention/views/widgets/custom_pic.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomCartItem extends StatelessWidget {
  const CustomCartItem({
    Key? key,
    required this.price,
    required this.title,
    required this.imageUrl,
    required this.id,
  }) : super(key: key);

  final String title, imageUrl, id;
  final double price;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RemoveFromCartCubit(CartRepoImp(api: DioConsumer(dio: Dio()))),
      child: BlocConsumer<RemoveFromCartCubit, RemoveFromCartState>(
        listener: (context, state) {
          if (state is RemoveFromCartSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.msg),
              ),
            );
          }else if(state is RemoveFromCartFaliure){
            ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMsg),
            ),
          );
          }
        },
        builder: (context, state) {
          return ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CustomPic(
              imageUrl: imageUrl,
            ),
            title: Text(
              title,
              style: AppStyles.poppinsStyleBold18(context),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Row(
              children: [
                Text(
                  '$price EGP',
                  style: AppStyles.interStyleRegular12(context),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(),
               state is RemoveFromCartLoading
                    ? const CircularProgressIndicator()
                    : IconButton(
                  onPressed: () {
                    context
                        .read<RemoveFromCartCubit>()
                        .removeFromCart(productId: id);
                  },
                  icon: const Icon(
                    FontAwesomeIcons.trash,
                    size: 18,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
