import 'package:bloc/bloc.dart';
import 'package:climb_up/features/cart/data/repos/cart_repo.dart';
import 'package:meta/meta.dart';

part 'remove_from_cart_state.dart';

class RemoveFromCartCubit extends Cubit<RemoveFromCartState> {
  RemoveFromCartCubit(this.cartRepo) : super(RemoveFromCartInitial());
  final CartRepo cartRepo;
  removeFromCart({required String productId}) async {
    emit(RemoveFromCartLoading());
    final response = await cartRepo.deleteCartProducts(productId: productId);
    response.fold((err) => emit(RemoveFromCartFaliure(errMsg: err)),
        (success) => emit(RemoveFromCartSuccess(msg: success)));
  }
}
