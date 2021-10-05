import 'package:e_commerce_app/modules/cart/cubit/cart_cubit.dart';
import 'package:e_commerce_app/modules/checkout/cubit/cubit.dart';
import 'package:e_commerce_app/modules/checkout/cubit/state.dart';
import 'package:e_commerce_app/shared/components/custom_text.dart';
import 'package:e_commerce_app/shared/helper/constance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SummaryScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: BlocConsumer<CartCubit,CartState>(
            listener: (context, state) {},
            builder: (context, state) {

              var cubit = CartCubit.get(context);

              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 20.0),
                  Container(
                    height: 250,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Container(
                        width: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 180,
                              height: 180,
                              child: Image.network(
                                cubit.cartProducts[index].image!,
                                fit: BoxFit.fill,
                              ),
                            ),
                            RichText(
                              maxLines: 1,
                              textAlign: TextAlign.start,
                              text: TextSpan(
                                text: cubit.cartProducts[index].name!,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            CustomText(
                              text: '\$' + '${cubit.cartProducts[index].price!}',
                              alignment: Alignment.bottomLeft,
                              color: primaryColor,
                            ),
                          ],
                        ),
                      ),
                      itemCount: cubit.cartProducts.length,
                      // itemCount: controller.cartProductModel.length,
                      separatorBuilder: (context, index) => SizedBox(width: 20),
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomText(
                    text: 'Shipping Address',
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    alignment: Alignment.centerLeft,
                  ),
                  const SizedBox(height: 5),
                  BlocConsumer<CheckoutCubit, CheckoutState>(
                    listener: (context, state) {},
                    builder: (context, state) {

                      var checkoutCubit = CheckoutCubit.get(context);

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            flex: 4,
                            child: RichText(
                              maxLines: 10,
                              textAlign: TextAlign.start,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '${checkoutCubit.street1}, ' +'${checkoutCubit.street2}, ' + '${checkoutCubit.state1}, ' + '${checkoutCubit.city}, ' + '${checkoutCubit.country}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Flexible(
                            child: const Icon(
                              Icons.check_circle,
                              color: primaryColor,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
