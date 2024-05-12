import 'package:bloc/bloc.dart';
import 'package:climb_up/features/home/data/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'addproduct_to_cart_state.dart';

class AddproductToCartCubit extends Cubit<AddproductToCartState> {
  AddproductToCartCubit(this.homeRepo) : super(AddproductToCartInitial());
  final HomeRepo homeRepo;

  addProductToCart({required String productId}) async {
    emit(AddproductToCartLoading());
    final response = await homeRepo.addProductToCart(productId: productId);
    response.fold((err) => emit(AddproductToCartFaliure(errorMsg: err)),
        (success) => emit(AddproductToCartSuccess(msg: success)));
  }
}
