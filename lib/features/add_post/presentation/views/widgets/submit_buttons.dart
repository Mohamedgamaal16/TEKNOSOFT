import 'package:climb_up/core/utils/app_styles.dart';
import 'package:climb_up/core/widgets/custom_button.dart';
import 'package:climb_up/features/add_post/presentation/view_models/cubit/add_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubmitButtons extends StatelessWidget {
  const SubmitButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductSucces) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('proudct added successfully'),
            ),
          );
        } else if (state is AddProductFaliure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMsg),
            ),
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Row(
            children: [
              Text(
                'Clear',
                style: AppStyles.poppinsStyleSemiBold16(context).copyWith(
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                ),
              ),
              const Spacer(),
            state is AddProductLoading
                        ? const CircularProgressIndicator()
                        :   SizedBox(
                height: MediaQuery.of(context).size.height * .05,
                child: CustomButton(
                  borderRadius: 8,
                  onPressed: () {
                    context.read<AddProductCubit>().addProduct();
                  },
                  labelName: 'Create',
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
