part of 'fetch_cart_products_cubit.dart';

@immutable
sealed class FetchCartProductsState {}

final class FetchCartProductsInitial extends FetchCartProductsState {}

final class FetchCartProductsSuccess extends FetchCartProductsState {

  final CartProductsModel cartProductsModel;

  FetchCartProductsSuccess({required this.cartProductsModel});
}

final class FetchCartProductsLoading extends FetchCartProductsState {}

final class FetchCartProductsFaliure extends FetchCartProductsState {
  final String errMsg;

  FetchCartProductsFaliure({required this.errMsg});
}
