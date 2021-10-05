import 'package:e_commerce_app/modules/checkout/cubit/cubit.dart';
import 'package:e_commerce_app/modules/checkout/cubit/state.dart';
import 'package:e_commerce_app/shared/components/custom_text.dart';
import 'package:e_commerce_app/shared/components/custom_text_form_field.dart';
import 'package:e_commerce_app/shared/helper/constance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddAddressScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: BlocConsumer<CheckoutCubit,CheckoutState>(
            listener: (context, state){},
            builder: (context, state){

              var cubit = CheckoutCubit.get(context);
              return Form(
                key: cubit.formState,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                      [
                        const Icon(
                          Icons.check_circle,
                          color: primaryColor,
                        ),
                        const SizedBox(width: 10.0),
                        Expanded(
                          child: CustomText(
                            text: 'Billing address is the same as delivery address',
                            fontSize: 20,
                            alignment: Alignment.center,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30.0),
                    CustomTextFormField(
                      type: TextInputType.text,
                      text: 'Street 1',
                      hint: '21, Alex Davidson Avenue',
                      onSaved: (value){
                        cubit.street1 = value;
                        print(value);
                      },
                      validate: (value){
                        if(value.isEmpty){
                          return 'you must enter your street';
                        }
                      },
                    ),
                    const SizedBox(height: 30.0),
                    CustomTextFormField(
                      type: TextInputType.text,
                      text: 'Street 2',
                      hint: 'Opposite Omegatron, Vicent Quarters',
                      onSaved: (value){
                        cubit.street2 = value;
                        print(value);
                      },
                      validate: (value){
                        if(value.isEmpty){
                          return 'you must enter your street';
                        }
                      },
                    ),
                    const SizedBox(height: 30.0),
                    CustomTextFormField(
                      type: TextInputType.text,
                      text: 'City',
                      hint: 'Victoria Island',
                      onSaved: (value){
                        cubit.city = value;
                        print(value);
                      },
                      validate: (value){
                        if(value.isEmpty){
                          return 'you must enter your city';
                        }
                      },
                    ),
                    const SizedBox(height: 30),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children:
                        [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: CustomTextFormField(
                                type: TextInputType.text,
                                text: 'State',
                                hint: 'Lagos State',
                                onSaved: (value){
                                  cubit.state1 = value;
                                  print(value);
                                },
                                validate: (value){
                                  if(value.isEmpty){
                                    return 'state must not empty';
                                  }
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: CustomTextFormField(
                                type: TextInputType.text,
                                text: 'Country',
                                hint: 'Nigeria',
                                onSaved: (value){
                                  cubit.country = value;
                                  print(value);
                                },
                                validate: (value){
                                  if(value.isEmpty){
                                    return 'country must not empty';
                                  }
                                },
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
          ),
        ),
      ),
    );
  }
}
