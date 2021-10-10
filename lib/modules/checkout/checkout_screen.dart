import 'package:e_commerce_app/layouts/cubit/home_layout_cubit.dart';
import 'package:e_commerce_app/layouts/home_layout.dart';
import 'package:e_commerce_app/modules/cart/cart_screen.dart';
import 'package:e_commerce_app/modules/cart/cubit/cart_cubit.dart';
import 'package:e_commerce_app/modules/checkout/add_address_screen.dart';
import 'package:e_commerce_app/modules/checkout/cubit/cubit.dart';
import 'package:e_commerce_app/modules/checkout/cubit/state.dart';
import 'package:e_commerce_app/modules/checkout/summary_screen.dart';
import 'package:e_commerce_app/shared/components/components.dart';
import 'package:e_commerce_app/shared/components/custom_button.dart';
import 'package:e_commerce_app/shared/helper/constance.dart';
import 'package:e_commerce_app/shared/helper/enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:status_change/status_change.dart';

import 'delivery_time_screen.dart';

class CheckOutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).viewInsets.bottom == 0) {
      print('keyboard closed');
    } else {
      print('keyboard opened');
    }

    var size = MediaQuery.of(context).size;

    return BlocConsumer<CheckoutCubit, CheckoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        var checkOutCubit = CheckoutCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0.0,
            title: Text(
              "CheckOut",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            leading: GestureDetector(
              onTap: () {
                navigateAndFinish(context, CartScreen());
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
          ),
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Container(
                height: 100,
                child: StatusChange.tileBuilder(
                  theme: StatusChangeThemeData(
                    direction: Axis.horizontal,
                    connectorTheme:
                        ConnectorThemeData(space: 1.0, thickness: 1.0),
                  ),
                  builder: StatusChangeTileBuilder.connected(
                    itemWidth: (_) => size.width / _processes.length,
                    nameWidgetBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Text(
                          _processes[index],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: checkOutCubit.getColor(index),
                          ),
                        ),
                      );
                    },
                    contentWidgetBuilder: (context, index) {
                      return Container();
                    },
                    indicatorWidgetBuilder: (_, index) {
                      if (index <= checkOutCubit.index) {
                        return DotIndicator(
                          size: 35.0,
                          border: Border.all(color: Colors.green, width: 1),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        );
                      } else {
                        return OutlinedDotIndicator(
                          size: 30,
                          borderWidth: 1.0,
                          color: todoColor,
                        );
                      }
                    },
                    lineWidgetBuilder: (index) {
                      if (index > 0) {
                        if (index == checkOutCubit.index) {
                          final prevColor = checkOutCubit.getColor(index - 1);
                          final color = checkOutCubit.getColor(index);
                          var gradientColors;
                          gradientColors = [
                            prevColor,
                            (Color.lerp(prevColor, color, 0.5))!
                          ];
                          return DecoratedLineConnector(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: gradientColors,
                              ),
                            ),
                          );
                        } else {
                          return SolidLineConnector(
                            color: checkOutCubit.getColor(index),
                          );
                        }
                      } else {
                        return null;
                      }
                    },
                    itemCount: _processes.length,
                  ),
                ),
              ),
              checkOutCubit.pages == Pages.DeliveryTime
                  ? DeliveryTimeScreen()
                  : checkOutCubit.pages == Pages.AddAddress
                      ? AddAddressScreen()
                      : SummaryScreen(),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    checkOutCubit.index == 0
                        ? Container()
                        : Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              width: 140,
                              height: 50,
                              child: CustomButton(
                                onPressed: () {
                                  checkOutCubit.changeIndex(
                                      checkOutCubit.index - 1, context);
                                },
                                text: 'BACK',
                                color: Colors.white,
                                textColor: primaryColor,
                                radius: 5,
                              ),
                            ),
                          ),
                    checkOutCubit.index == 2
                        ? BlocConsumer<CartCubit, CartState>(
                            listener: (context, state) {},
                            builder: (context, state) {

                              var cartCubit = CartCubit.get(context);

                              return Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  width: 140,
                                  height: 50,
                                  child: CustomButton(
                                    onPressed: () {
                                      checkOutCubit.sendOrder(
                                        dateTime: DateTime.now().toString(),
                                        products: cartCubit.cartProducts,
                                      ).then((value){
                                        cartCubit.cartProducts.clear();
                                        cartCubit.clearDatabaseContent();
                                        print(cartCubit.cartProducts);
                                        HomeLayoutCubit.get(context).currentIndex = 0;
                                      }).whenComplete(() => navigateAndFinish(context, HomeLayout()));
                                    },
                                    text: 'DELIVERY',
                                    radius: 5,
                                  ),
                                ),
                              );
                            },
                          )
                        : Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              width: 140,
                              height: 50,
                              child: CustomButton(
                                onPressed: () {
                                  checkOutCubit.changeIndex(
                                      checkOutCubit.index + 1, context);
                                },
                                text: 'NEXT',
                                radius: 5,
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

final _processes = [
  'Delivery',
  'Address',
  'Summary',
];
