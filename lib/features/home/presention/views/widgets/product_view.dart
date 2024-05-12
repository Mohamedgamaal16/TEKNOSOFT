import 'package:climb_up/features/home/data/models/material_model.dart';
import 'package:climb_up/features/home/presention/view_models/fetch_product_data_cubit/fetch_product_data_cubit.dart';
import 'package:climb_up/features/home/presention/views/widgets/custom_card.dart';
import 'package:climb_up/features/home/presention/views/widgets/product_detailes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchProductDataCubit, FetchProductDataState>(
      builder: (context, state) {
        if (state is FetchProductDataSuccess) {
          return ListView.builder(
            itemCount: state.productDataModel.products.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (builder) {
                        return ProductDisplay(
                          netWorkImage: true,
                          materialProductModel: MaterialProductModel(
                              pics:
                                  state.productDataModel.products[index].photos,
                              title:
                                  state.productDataModel.products[index].name,
                              rate: "5",
                              price: state
                                  .productDataModel.products[index].priceEGP
                                  .toString(),
                              details: state.productDataModel.products[index]
                                  .description),
                          call: true, productId: state.productDataModel.products[index].id,
                        );
                      }));
                    },
                    child: CustomCard(
                      networkImage: true,
                      materialProductModel: MaterialProductModel(
                          pics: state.productDataModel.products[index].photos,
                          title: state.productDataModel.products[index].name,
                          rate: "5",
                          price: state.productDataModel.products[index].priceEGP
                              .toString(),
                          details: state
                              .productDataModel.products[index].description),
                    ),
                  ));
            },
          );
        } else if (state is FetchProductDataFaliure) {
          return Text(state.errMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
