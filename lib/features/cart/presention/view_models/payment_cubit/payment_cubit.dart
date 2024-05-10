import 'package:bloc/bloc.dart';
import 'package:climb_up/features/cart/data/repos/cart_repo.dart';
import 'package:meta/meta.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.cartRepo) : super(PaymentInitial());
  CartRepo cartRepo;
  

payWithPayMob({required int totalPrice}) async {
  emit(PaymentLoading());
  
 
    final urlEither = await cartRepo.payWithPayMob(amount: totalPrice, currency: 'EGP');
    urlEither.fold(
      (err) => emit(PaymentFailure(errorMessage: err)),
      (success) => emit(PaymentSuccess(paymentKey: success)),
    );
 
}

}
