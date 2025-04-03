import 'dart:math';

import 'package:dartz/dartz.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/home_repo.dart';
import 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this._homeRepo) : super(CategoriesInitial());
  final HomeRepo _homeRepo;
  void fetchCategories() async {
    emit(CategoriesLoading());

    final Either<String, List<String>> res = await _homeRepo.getCategories();

    res.fold((error) {
      emit(CategoriesError(error));
    }, (right) {
      emit(CategoriesLoaded(right));
    });
  }
}
