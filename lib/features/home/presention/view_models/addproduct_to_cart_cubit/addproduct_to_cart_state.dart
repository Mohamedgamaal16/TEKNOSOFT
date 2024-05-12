part of 'addproduct_to_cart_cubit.dart';

@immutable
sealed class AddproductToCartState {}

final class AddproductToCartInitial extends AddproductToCartState {}
final class AddproductToCartSuccess extends AddproductToCartState {
  final String msg;

  AddproductToCartSuccess({required this.msg});
}
final class AddproductToCartLoading extends AddproductToCartState {}
final class AddproductToCartFaliure extends AddproductToCartState {
  final String errorMsg;

  AddproductToCartFaliure({required this.errorMsg});
}
