import 'package:bloc/bloc.dart';
import 'package:climb_up/features/home/data/models/product_model.dart';
import 'package:climb_up/features/home/data/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'fetch_product_data_state.dart';

class FetchProductDataCubit extends Cubit<FetchProductDataState> {
  FetchProductDataCubit(this.homeRepo) : super(FetchProductDataInitial());

  final HomeRepo homeRepo;

  fetchProductsData() async {
    emit(FetchProductDataLoading());
    final reponse = await homeRepo.fetchProducts();

    reponse.fold((err) => emit(FetchProductDataFaliure(errMessage: err)),
        (success) => emit(FetchProductDataSuccess(productDataModel: success)));
  }
}
