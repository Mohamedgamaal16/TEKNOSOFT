import 'package:bloc/bloc.dart';
import 'package:climb_up/features/cart/data/models/cart_products_model.dart';
import 'package:climb_up/features/cart/data/repos/cart_repo.dart';
import 'package:meta/meta.dart';

part 'fetch_cart_products_state.dart';

class FetchCartProductsCubit extends Cubit<FetchCartProductsState> {
  FetchCartProductsCubit(this.cartRepo) : super(FetchCartProductsInitial());

  final CartRepo cartRepo;

  fetchCartProducts() async {
    emit(FetchCartProductsLoading());
    final response = await cartRepo.fetchCartProducts();
    response.fold(
        (err) => emit(FetchCartProductsFaliure(errMsg: err)),
        (success) =>
            emit(FetchCartProductsSuccess(cartProductsModel: success)));
  }
}
