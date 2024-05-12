part of 'fetch_product_data_cubit.dart';

@immutable
sealed class FetchProductDataState {}

final class FetchProductDataInitial extends FetchProductDataState {}
final class FetchProductDataSuccess extends FetchProductDataState {

  final ProductDataModel productDataModel;

  FetchProductDataSuccess({required this.productDataModel});
}
final class FetchProductDataLoading extends FetchProductDataState {}
final class FetchProductDataFaliure extends FetchProductDataState {

  final String errMessage;

  FetchProductDataFaliure({required this.errMessage});
}
