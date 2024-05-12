import 'package:climb_up/core/utils/app_styles.dart';
import 'package:climb_up/core/utils/constants.dart';
import 'package:climb_up/core/widgets/custom_button.dart';
import 'package:climb_up/features/home/presention/view_models/addproduct_to_cart_cubit/addproduct_to_cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class ProductFooter extends StatelessWidget {
  const ProductFooter({
    super.key,
    required this.price,
    required this.call,
    required this.supportCallCenterNum,
    required this.productId,
  });

  final String price, productId;
  final bool call;
  final String supportCallCenterNum;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddproductToCartCubit, AddproductToCartState>(
        listener: (context, state) {
      if (state is AddproductToCartSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(state.msg),
          ),
        );
      } else if (state is AddproductToCartFaliure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(state.errorMsg),
          ),
        );
      }
    }, builder: (context, state) {
      return Positioned(
        bottom: 0,
        right: 0,
        left: 0,
        child: Padding(
          padding: const EdgeInsets.only(right: 18.0, left: 18, bottom: 4),
          child: Container(
            color: Colors.white,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Price',
                      style: AppStyles.poppinsStyleRegular12(context)
                          .copyWith(color: Colors.black54),
                    ),
                    Text(
                      // ignore: unnecessary_brace_in_string_interps
                      '${price} EGP',
                      style: AppStyles.poppinsStyleBold18(context),
                    ),
                  ],
                ),
                const Spacer(),
                state is AddproductToCartLoading
                    ? CircularProgressIndicator()
                    : CustomButton(
                        labelName: call ? 'Add to cart' : "call center",
                        color: AppColors.kPrimaryColor,
                        textColor: Colors.white,
                        onPressed: () async {
                          call
                              ? (context
                                  .read<AddproductToCartCubit>()
                                  .addProductToCart(productId: productId))
                              : await FlutterPhoneDirectCaller.callNumber(
                                  supportCallCenterNum);
                        },
                      ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
