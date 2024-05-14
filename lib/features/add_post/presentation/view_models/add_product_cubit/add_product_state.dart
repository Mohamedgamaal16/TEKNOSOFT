part of 'add_product_cubit.dart';

@immutable
sealed class AddProductState {}

final class AddProductInitial extends AddProductState {}
final class AddProductSuccess extends AddProductState {
  final String status;

  AddProductSuccess({required this.status});
}
final class AddProductLoading extends AddProductState {}
final class AddProductFaliure extends AddProductState {
    final String errMsg;

  AddProductFaliure({required this.errMsg});

}

final class UploadPic extends AddProductState {}

