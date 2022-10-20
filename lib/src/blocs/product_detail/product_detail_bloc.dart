import 'package:belajar_flutter/src/models/models.dart';
import 'package:belajar_flutter/src/screens/screens.dart';
import 'package:belajar_flutter/src/services/services.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  ProductDetailBloc() : super(ProductDetailInitial()) {
    on<FetchProductDetail>((event, emit) async {
      //kita buat kondisi dia loading
      emit(ProductDetailIsLoading());

      //fetch detail product from API
      final result = await ProductService().fetchProductDetail(event.id);
      //buat kondisi jika berhasil, dan gagal
      if (result.data != null) {
        final data = detailProductModelFromJson(result.data);
        emit(ProductDetailIsSuccess(data));
      } else {
        emit(ProductDetailIsFailed(result.message));
      }
    });
  }
}
