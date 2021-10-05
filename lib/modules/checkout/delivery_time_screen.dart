import 'package:e_commerce_app/modules/checkout/cubit/cubit.dart';
import 'package:e_commerce_app/shared/components/custom_text.dart';
import 'package:e_commerce_app/shared/helper/enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/state.dart';

class DeliveryTimeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: BlocConsumer<CheckoutCubit, CheckoutState>(
            listener: (context, state){},
            builder: (context, state){
              var cubit = CheckoutCubit.get(context);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20.0),
                  CustomText(
                    text: 'Standard Delivery',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    height: 1.4,
                    alignment: Alignment.centerLeft,
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 4,
                        child: CustomText(
                          text:
                          'Order will be delivered between 3 - 5 business days',
                          fontSize: 14,
                          height: 1.6,
                          color: Colors.black,
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                      Expanded(
                        child: Radio(
                          value: Delivery.StandardDelivery,
                          groupValue: cubit.delivery,
                          onChanged: (Delivery? value) {
                            cubit.changeRadio(value!);
                            print(value);
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50.0),
                  CustomText(
                    text: 'Next Day Delivery',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    height: 1.4,
                    alignment: Alignment.centerLeft,
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 4,
                        child: CustomText(
                          text:
                          'Place your order before 6pm and your items will be delivered the next day',
                          fontSize: 14,
                          height: 1.6,
                          color: Colors.black,
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                      Expanded(
                        child: Radio(
                          value: Delivery.NextDayDelivery,
                          groupValue: cubit.delivery,
                          onChanged: (Delivery? value) {
                            cubit.changeRadio(value!);
                            print(value);
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50.0),
                  CustomText(
                    text: 'Nominated Delivery',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    height: 1.4,
                    alignment: Alignment.centerLeft,
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: CustomText(
                          text:
                          'Pick a particular date from the calendar and order will be delivered on selected date',
                          fontSize: 14,
                          height: 1.6,
                          color: Colors.black,
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                      Expanded(
                        child: Radio(
                          value: Delivery.NominatedDelivery,
                          groupValue: cubit.delivery,
                          onChanged: (Delivery? value) {
                            cubit.changeRadio(value!);
                            print(value);
                          },
                        ),
                      ),
                    ],
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
