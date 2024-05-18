import 'package:bloc/bloc.dart';
import 'package:climb_up/core/function/upload_image_to_api.dart';
import 'package:climb_up/features/add_post/data/repo/add_product_repo.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.api) : super(AddProductInitial());
  XFile? pic1, pic2, pic3, pic4;
  final AddproductRepo api;
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController price = TextEditingController();

  addProduct() async {
    emit(AddProductLoading());
    try {
      final response = await api.addProduct(pic2, pic3, pic4,
          name: name.text,
          price: price.text,
          description: description.text,
          pic: pic1!);
     
      response.fold((err) => emit(AddProductFaliure(errMsg: err)),
          (success) => emit(AddProductSuccess(status: success)));
    }  catch (e) {
      if (e.toString() == 'Null check operator used on a null value') {
        emit(AddProductFaliure(errMsg: "Please fill the full data"));
      } else {
        emit(AddProductFaliure(errMsg: e.toString()));
      }
    }
  }

  uploadProfilePic1(XFile image) async {
    pic1 = image;

    emit(UploadPic());
  }

  uploadProfilePic2(XFile image) {
    pic2 = image;
    emit(UploadPic());
  }

  uploadProfilePic3(XFile image) {
    pic3 = image;
    emit(UploadPic());
  }

  uploadProfilePic4(XFile image) {
    pic4 = image;
    emit(UploadPic());
  }
}
