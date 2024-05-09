import 'package:bloc/bloc.dart';
import 'package:climb_up/features/cart/data/repos/cart_repo.dart';
import 'package:meta/meta.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.cartRepo) : super(PaymentInitial());
  CartRepo cartRepo;
  // payWithPayMob({required int totalPrice}) async {
  //   emit(PaymentLoading());
    
  //     final url = cartRepo.payWithPayMob(totalPrice: totalPrice);
  //     url.fold((err) => emit(PaymentFailure(errorMessage: err)),
  //         (success) => emit(PaymentSuccess(url: success)));
      
  // }

payWithPayMob({required int totalPrice}) async {
  emit(PaymentLoading());
  
  try {
    final urlEither = await cartRepo.payWithPayMob(totalPrice: totalPrice);
    urlEither.fold(
      (err) => emit(PaymentFailure(errorMessage: err)),
      (success) => emit(PaymentSuccess(url: success)),
    );
  } catch (e) {

    emit(PaymentFailure(errorMessage: 'An error occurred: $e'));
  }
}

}
