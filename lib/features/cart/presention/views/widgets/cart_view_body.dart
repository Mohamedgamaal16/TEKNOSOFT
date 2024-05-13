import 'package:climb_up/core/utils/app_styles.dart';
import 'package:climb_up/features/cart/presention/view_models/fetch_cart_products_cubit/fetch_cart_products_cubit.dart';

import 'package:climb_up/features/cart/presention/views/widgets/cart_footer.dart';
import 'package:climb_up/features/cart/presention/views/widgets/custom_cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchCartProductsCubit, FetchCartProductsState>(
      builder: (context, state) {
        if (state is FetchCartProductsSuccess) {
          return Stack(children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Text(
                    'Cart',
                    style: AppStyles.poppinsStyleBold24(context),
                  ),
                ),
                SliverList.builder(
                  itemCount: state.cartProductsModel.data.products.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: CustomCartItem(
                        price: state
                            .cartProductsModel.data.products[index].priceEGP
                            .toDouble(),
                        title:
                            state.cartProductsModel.data.products[index].name,
                        imageUrl: state
                            .cartProductsModel.data.products[index].photos[0],
                        id: state.cartProductsModel.data.products[index].id,
                      ),
                    );
                  },
                ),
                const SliverToBoxAdapter(
                    child: SizedBox(
                  height: 50,
                )),
              ],
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: CartFooter(
                totalPrice: state.cartProductsModel.data.totalprice,
              ),
            )
          ]);
        } else if (state is FetchCartProductsFaliure) {
          return Text(state.errMsg);
        } else {
          return SizedBox(
              height: MediaQuery.of(context).size.height * 1,
              child: const Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
