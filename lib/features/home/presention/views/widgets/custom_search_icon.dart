import 'package:climb_up/core/utils/app_styles.dart';
import 'package:climb_up/features/cart/presention/views/widgets/custom_cart_item.dart';
import 'package:climb_up/features/home/data/models/material_model.dart';
import 'package:climb_up/features/home/data/models/product_model.dart';
import 'package:climb_up/features/home/presention/view_models/fetch_product_data_cubit/fetch_product_data_cubit.dart';
import 'package:climb_up/features/home/presention/views/widgets/custom_search_item.dart';
import 'package:climb_up/features/home/presention/views/widgets/product_detailes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchProductDataCubit, FetchProductDataState>(
      listener: (context, state) {},
      builder: (context, state) {
        return IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            if (state is FetchProductDataLoading) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Please wait...')),
              );
            } else if (state is FetchProductDataSuccess) {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(
                    productDataModel: state.productDataModel),
              );
            } else {
              context.read<FetchProductDataCubit>().fetchProductsData();
            }
          },
        );
      },
    );
  }
}

class CustomSearchDelegate extends SearchDelegate<String> {
  final ProductDataModel productDataModel;

  CustomSearchDelegate({
    super.searchFieldLabel,
    super.searchFieldStyle,
    super.searchFieldDecorationTheme,
    super.keyboardType,
    super.textInputAction,
    required this.productDataModel,
  });

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Get the list of products matching the query
    final results = productDataModel.products.where((product) {
      return product.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (builder) {
                return ProductDisplay(
                  netWorkImage: true,
                  materialProductModel: MaterialProductModel(
                      pics: results[index].photos,
                      // state.productDataModel.products[index].photos,
                      title: results[index].name,
                      rate: "5",
                      price: results[index].priceEGP.toString(),
                      details: results[index].description),
                  call: true,
                  productId: results[index].id,
                );
              }));
            },
            child: CustomSearchItem(
              price: results[index].priceEGP.toDouble(),
              title: results[index].name,
              imageUrl: results[index].photos[0],
              id: results[index].id,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> filter = query.isEmpty
        ? productDataModel.products.map((product) => product.name).toList()
        : productDataModel.products
            .where((product) {
              return product.name.toLowerCase().contains(query.toLowerCase());
            })
            .map((product) => product.name)
            .toList();

    return ListView.builder(
      itemCount: filter.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          child: GestureDetector(
            onTap: () {
              query = filter[index];
              showResults(context);
            },
            child: Text(
              filter[index],
              style: AppStyles.poppinsStyleMedium12(context)
                  .copyWith(color: Colors.black),
            ),
          ),
        );
      },
    );
  }
}
