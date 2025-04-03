import 'package:ecommerce_app/core/routing/app_routes.dart';
import 'package:ecommerce_app/core/utils/service_locator.dart';

import 'package:ecommerce_app/features/main_screen/main_screen.dart';
import 'package:ecommerce_app/features/product_screen/product_screen.dart';
import 'package:ecommerce_app/features/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:go_transitions/go_transitions.dart';

import '../../features/address/presintation/view/screens/address_screen.dart';
import '../../features/auth/presentation/view/screens/login_screen.dart';
import '../../features/auth/presentation/view/screens/register_screen.dart';
import '../../features/auth/presentation/viewModel/auth_cubit.dart';
import '../../features/cart/presentaion/viewModel/cart_cubit.dart';
import '../../features/home_screen/data/models/products_model.dart';

class RouterGenerationConfig {
  static GoRouter goRouter =
      GoRouter(initialLocation: AppRoutes.splashScreen, routes: [
    GoRoute(
      name: AppRoutes.splashScreen,
      path: AppRoutes.splashScreen,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      name: AppRoutes.loginScreen,
      path: AppRoutes.loginScreen,
      builder: (context, state) => BlocProvider(
        create: (context) => sl<AuthCubit>(),
        child: const LoginScreen(),
      ),
    ),
    GoRoute(
      name: AppRoutes.registerScreen,
      path: AppRoutes.registerScreen,
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      name: AppRoutes.mainScreen,
      path: AppRoutes.mainScreen,
      builder: (context, state) => BlocProvider(
        create: (context) => sl<CartCubit>(),
        child: const MainScreen(),
      ),
    ),
    GoRoute(
        name: AppRoutes.productScreen,
        path: AppRoutes.productScreen,
        builder: (context, state) {
          ProductsModel product = state.extra as ProductsModel;
          return BlocProvider(
            create: (context) => sl<CartCubit>(),
            child: ProductScreen(
              product: product,
            ),
          );
        }),
    GoRoute(
      name: AppRoutes.addressScreen,
      path: AppRoutes.addressScreen,
      builder: (context, state) => const AddressScreen(),
    ),
  ]);
}
