import 'package:climb_up/core/utils/app_styles.dart';
import 'package:climb_up/core/utils/constants.dart';
import 'package:climb_up/core/widgets/custom_button.dart';
import 'package:climb_up/features/cart/presention/view_models/payment_cubit/payment_cubit.dart';
import 'package:climb_up/features/cart/presention/views/widgets/card_web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CartFooter extends StatelessWidget {
  const CartFooter({
    super.key,
    required this.totalPrice,
  });
  final int totalPrice;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: Row(
            children: [
              const SizedBox(
                width: 8,
              ),
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
                    '${totalPrice} EGP',
                    style: AppStyles.poppinsStyleBold18(context),
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                height: MediaQuery.of(context).size.height * .07,
                child: CustomButton(
                  labelName: 'Check Out',
                  color: AppColors.kPrimaryColor,
                  textColor: Colors.white,
                  onPressed: () async {
                    if (state is PaymentSuccess) {
                      // context.read<PaymentCubit>().payWithPayMob(totalPrice: totalPrice);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CardWebView(
                            totalPrice: totalPrice, paymentToken: state.url);
                      }));
                    }
                     else if (state is PaymentFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(state.errorMessage),
                      ));
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
