import 'package:e_commerce_app/models/cart_product_model.dart';
import 'package:e_commerce_app/modules/cart/cubit/cart_cubit.dart';
import 'package:e_commerce_app/shared/components/custom_button.dart';
import 'package:e_commerce_app/shared/components/custom_slidable_actions.dart';
import 'package:e_commerce_app/shared/components/custom_text.dart';
import 'package:e_commerce_app/shared/constance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (BuildContext context, state) {
      },
      builder: (BuildContext context, state) {
        var cubit = CartCubit.get(context);

        return Scaffold(
          body: cubit.cartProducts.isEmpty
              ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/empty_cart.svg',
                    width: 200,
                    height: 200,
                  ),
                  SizedBox(height: 20),
                  CustomText(
                    text: 'Cart Empty',
                    fontSize: 32,
                    alignment: Alignment.topCenter,
                  ),
                ],
              )
              : Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return SlidableWidget(
                              child: builtCartItem(cubit.cartProducts[index], cubit, index),
                              onRightTap: (){
                                cubit.deleteProduct(cubit.cartProducts[index], index);
                              },
                              onLeftTap: (){
                                print('Added to favorite');
                              },
                            );
                          },
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 15.0),
                          itemCount: cubit.cartProducts.length,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                CustomText(
                                  text: 'TOTAL',
                                  fontSize: 16.0,
                                  color: Colors.grey.shade400,
                                ),
                                SizedBox(height: 10.0),
                                CustomText(
                                  text: '\$' + '${cubit.totalPrice}',
                                  fontSize: 20.0,
                                  color: primaryColor,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: CustomButton(
                              onPressed: () {},
                              text: 'Checkout',
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }

  Widget builtCartItem(CartProductModel model, CartCubit cubit, int index) => Container(
        height: 120,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                width: 200.0,
                padding: EdgeInsetsDirectional.only(start: 10.0),
                child: Image(
                  width: 200.0,
                  fit: BoxFit.fill,
                  image: NetworkImage('${model.image}'),
                ),
              ),
            ),
            SizedBox(width: 10.0),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: '${model.name}',
                    fontWeight: FontWeight.w600,
                    fontSize: 15.0,
                  ),
                  SizedBox(height: 5.0),
                  CustomText(
                    text: '\$' + '${model.price}',
                    fontSize: 16.0,
                    color: primaryColor,
                  ),
                  SizedBox(height: 20.0),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Container(
                      width: 100,
                      color: Colors.grey.shade200,
                      height: 25,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              cubit.increaseQuantity(index);
                            },
                            child: Icon(
                              Icons.add,
                              size: 16.0,
                            ),
                          ),
                          SizedBox(width: 10.0),
                          CustomText(
                            text: '${model.quantity}',
                            alignment: Alignment.center,
                            fontSize: 20.0,
                          ),
                          SizedBox(width: 10.0),
                          InkWell(
                            onTap: () {
                              cubit.decreaseQuantity(index);
                            },
                            child: Container(
                              padding: EdgeInsetsDirectional.only(bottom: 10.0),
                              child: Icon(
                                Icons.minimize,
                                size: 16.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
