part of 'remove_from_cart_cubit.dart';

@immutable
sealed class RemoveFromCartState {}

final class RemoveFromCartInitial extends RemoveFromCartState {}

final class RemoveFromCartSuccess extends RemoveFromCartState {
  final String msg;

  RemoveFromCartSuccess({required this.msg});
}

final class RemoveFromCartFaliure extends RemoveFromCartState {
  final String errMsg;

  RemoveFromCartFaliure({required this.errMsg});
}

final class RemoveFromCartLoading extends RemoveFromCartState {}
