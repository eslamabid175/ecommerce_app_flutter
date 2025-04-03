
import 'package:ecommerce_app/features/home_screen/presentaion/viewModel/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/home_repo.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this._homeRepo) : super(ProductInitial());

  final HomeRepo _homeRepo;

  void fetchProducts() async {
    emit(ProductLoading());

    final res = await _homeRepo.getProducts();

    res.fold((error) {
      emit(ProductError(error));
    }, (right) {
      emit(ProductLoaded(right));
    });
  }

  void fetchProductCategories(String catName) async {
    emit(ProductLoading());

    final res = await _homeRepo.getProductCategories(catName);

    res.fold((error) {
      emit(ProductError(error));
    }, (right) {
      emit(ProductLoaded(right));
    });
  }
}
