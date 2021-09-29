import 'package:e_commerce_app/shared/components/custom_button.dart';
import 'package:e_commerce_app/shared/components/custom_text_form_field.dart';
import 'package:e_commerce_app/shared/constance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddAddressScreen extends StatelessWidget {

  var street1Controller = TextEditingController();
  var street2Controller = TextEditingController();
  var cityController = TextEditingController();
  var stateController = TextEditingController();
  var countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children:
                      [
                        Icon(
                          Icons.check_circle,
                          color: myGreen,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'Billing address in the same as delivery address'
                        ),
                      ],
                    ),
                    SizedBox(height: 25.0,),
                    Column(
                      children: [
                        CustomTextFormField(
                            controller: street1Controller,
                            type: TextInputType.text,
                            text: 'Street1',
                            hint: '21,Alex Davidson Avenue',
                            validate: (value){
                              if(value.isEmpty){
                                return 'street must not empty';
                              }
                              return null;
                            },
                        ),
                        SizedBox(height: 25.0,),
                        CustomTextFormField(
                            controller: street2Controller,
                            type: TextInputType.text,
                            text: 'Street2',
                            hint: 'Opposite Omegatron, Vicent Quarters',
                            validate: (value){
                              if(value.isEmpty){
                                return 'street must not empty';
                              }
                              return null;
                            },
                        ),
                        SizedBox(height: 25.0,),
                        CustomTextFormField(
                          controller: cityController,
                          type: TextInputType.text,
                          text: 'City',
                          hint: 'Victoria Island',
                          validate: (value){
                            if(value.isEmpty){
                              return 'city must not empty';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 25,),
                    Row(
                      children:
                      [
                        Expanded(
                          child: CustomTextFormField(
                            controller: stateController,
                            type: TextInputType.text,
                            text: 'State',
                            hint: 'Lagos State',
                            validate: (value){
                              if(value.isEmpty){
                                return 'state must not empty';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(width: 15.0,),
                        Expanded(
                          child: CustomTextFormField(
                            controller: countryController,
                            type: TextInputType.text,
                            text: 'Country',
                            hint: 'Nigeria',
                            validate: (value){
                              if(value.isEmpty){
                                return 'country must not empty';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
