import 'package:bloc/bloc.dart';
import 'package:climb_up/features/add_post/data/repo/add_product_repo.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.addproductRepo) : super(AddProductInitial());
  XFile? pic;
  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController descrption = TextEditingController();
  final AddproductRepo addproductRepo;
  addProduct() async {
    emit(AddProductLoading());
    try {
      final response = await addproductRepo.addProduct(
          name: name.text,
          price: price.text,
          descrption: descrption.text,
          pic: pic!);
      response.fold((error) => AddProductFaliure(errMsg: error),
          (success) => AddProductSucces());
    } catch (e) {
      emit(AddProductFaliure(errMsg: e.toString()));
    }
  }

  uploadProfilePic(XFile image) {
    pic = image;
    emit(UploadProfilePic());
  }
}
