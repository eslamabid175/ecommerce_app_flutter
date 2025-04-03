import 'package:ecommerce_app/core/styling/app_colors.dart';
import 'package:ecommerce_app/core/utils/service_locator.dart';
import 'package:ecommerce_app/features/account/presintation/view/screens/account_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../auth/presentation/viewModel/auth_cubit.dart';
import '../cart/presentaion/view/screens/cart_screen.dart';
import '../cart/presentaion/viewModel/cart_cubit.dart';
import '../home_screen/presentaion/view/screens/home_screen.dart';
import '../home_screen/presentaion/viewModel/categories_cubit.dart';
import '../home_screen/presentaion/viewModel/product_cubit.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  List<Widget> screens = [
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<ProductCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<CategoriesCubit>(),
        ),
      ],
      child: HomeScreen(),
    ),
    CartScreen(),
    BlocProvider(
      create: (context) => sl<AuthCubit>(),
      child: AccountScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.grey,
          elevation: 1,
          selectedItemColor: AppColors.primaryColor,
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });

            if (value == 1) {
              context.read<CartCubit>().fecthCarts();
            }
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 30.sp,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart,
                  size: 30.sp,
                ),
                label: "Cart"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_3_outlined,
                  size: 30.sp,
                ),
                label: "Account"),
          ],
        ),
      ),
    );
  }
}
