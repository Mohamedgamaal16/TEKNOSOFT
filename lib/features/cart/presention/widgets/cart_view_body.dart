import 'package:climb_up/core/utils/app_styles.dart';
import 'package:climb_up/features/cart/presention/widgets/custom_cart_item.dart';
import 'package:flutter/material.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:16.0),
            child: Text(
              'Cart',
              style: AppStyles.poppinsStyleBold24(context),
            ),
          ),
        ),
         
           SliverList.builder(
             itemCount: 20,
             itemBuilder: (context, index) {
               return const Padding(
                 padding: EdgeInsets.symmetric(horizontal:16.0,vertical: 8),
                 child: CustomCartItem(
                   price: 850,
                   title: 'Iphone 15 pro max',
                   imageUrl: 'https://i.ytimg.com/vi/fNSdPmbL6O8/sddefault.jpg'),
               );
             },
             
           ),
         
      ],
    );
  }
}
