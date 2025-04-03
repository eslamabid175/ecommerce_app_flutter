import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/networking/api_endpoints.dart';
import 'package:ecommerce_app/core/networking/dio_helper.dart';

import '../../../home_screen/data/models/products_model.dart';
import '../models/cart_model.dart';


class CartRepo {
  final DioHelper _dioHelper;

  CartRepo(this._dioHelper);

  Future<Either<String, CartModel>> getUserCart() async {
    try {
      final response =
          await _dioHelper.getRequest(endPoint: ApiEndpoints.carts + "/user/2");
      if (response.statusCode == 200) {
        CartModel cartModel = CartModel.fromJson(response.data[0]);

        return Right(cartModel);
      } else {
        return const Left("Error in Getting Cart");
      }
    } catch (e) {
      log(e.toString());
      return Left(e.toString());
    }
  }

  Future<Either<String, CartModel>> addToCart(
      {required String date,
      required ProductsModel product,
      required int quantity}) async {
    try {
      final response = await _dioHelper
          .putRequest(endPoint: ApiEndpoints.carts + "/3", data: {
        "userId": 2,
        "date": date,
        "products": [
          {
            "productId": product.id,
            "quantity": quantity,
          }
        ]
      });
      if (response.statusCode == 200) {
        CartModel cartModel = CartModel.fromJson(response.data);
        return Right(cartModel);
      } else {
        return const Left("Error in Getting Cart");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
