part of 'add_product_cubit.dart';

@immutable
sealed class AddProductState {}

final class AddProductInitial extends AddProductState {}
final class AddProductSucces extends AddProductState {}
final class AddProductLoading extends AddProductState {}
final class AddProductFaliure extends AddProductState {

  final String errMsg;

  AddProductFaliure({required this.errMsg});
}
final class UploadProfilePic extends AddProductState {}
