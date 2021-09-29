import 'package:e_commerce_app/modules/checkout/address_screen.dart';
import 'package:e_commerce_app/modules/checkout/cubit/cubit.dart';
import 'package:e_commerce_app/modules/checkout/cubit/state.dart';
import 'package:e_commerce_app/modules/checkout/summary_screen.dart';
import 'package:e_commerce_app/shared/components/components.dart';
import 'package:e_commerce_app/shared/components/custom_button.dart';
import 'package:e_commerce_app/shared/constance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:im_stepper/stepper.dart';

import 'deliverytime_screen.dart';

class CheckOutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CheckoutCubit(),
      child: BlocConsumer<CheckoutCubit, CheckoutState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = CheckoutCubit.get(context);
          return Scaffold(
              appBar: AppBar(),
              body: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      IconStepper(
                        icons: [
                          Icon(
                            Icons.check_circle_outline,
                            size: 5,
                          ),
                          Icon(
                            Icons.check_circle_outline,
                            size: 5,
                          ),
                          Icon(
                            Icons.check_circle_outline,
                            size: 5,
                          ),
                        ],
                        stepRadius: 13.0,
                        activeStep: cubit.activeStep,
                        enableNextPreviousButtons: false,
                        lineLength: 120,
                        activeStepColor: myGreen,
                        lineDotRadius: .3,
                        stepColor: Colors.grey[300],
                        onStepReached: (index) {
                          cubit.stepReach(index);
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      cubit.activeStep == 0
                          ? Expanded(child: DeliveryTimeScreen())
                          : cubit.activeStep == 1
                              ? Expanded(child: AddAddressScreen())
                              : Expanded(child: SummaryScreen()),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            cubit.activeStep == 0
                                ? Container()
                                : Align(
                                    alignment: Alignment.bottomRight,
                                    child: CustomButton(
                                      onPressed: () {
                                        cubit.minusIndex();
                                      },
                                      text: 'BACK',
                                      color: Colors.white,
                                      textColor: primaryColor,
                                    ),
                                  ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: CustomButton(
                                onPressed: () {
                                  cubit.incrementIndex();
                                },
                                text: 'Next',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}
