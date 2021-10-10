import 'package:e_commerce_app/layouts/cubit/home_layout_cubit.dart';
import 'package:e_commerce_app/shared/components/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit, HomeLayoutState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {

        var cubit = HomeLayoutCubit.get(context);

        return Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeIndex(index);
            },
            elevation: 0,
            selectedItemColor: Colors.black,
            backgroundColor: Colors.grey.shade50,
            items: [
              BottomNavigationBarItem(
                activeIcon: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: CustomText(
                    text: 'Explore',
                    alignment: Alignment.center,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                label: '.',
                icon: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Image.asset(
                    'assets/images/Icon_Explore.png',
                    fit: BoxFit.contain,
                    width: 20,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                activeIcon: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: CustomText(
                    text: 'Cart',
                    alignment: Alignment.center,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                label: '.',
                icon: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Image.asset(
                    'assets/images/Icon_Cart.png',
                    fit: BoxFit.contain,
                    width: 20,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                activeIcon: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: CustomText(
                    text: 'Profile',
                    alignment: Alignment.center,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                label: '.',
                icon: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Image.asset(
                    'assets/images/Icon_User.png',
                    fit: BoxFit.contain,
                    width: 20,
                  ),
                ),
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
