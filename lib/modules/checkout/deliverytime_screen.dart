import 'package:e_commerce_app/shared/components/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeliveryTimeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Standard Delivery',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children:
                    [
                      Expanded(
                        child: Text(
                          'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 13.0
                          ),
                        ),
                      ),
                      Radio(
                          value: 1,
                          groupValue: 1,
                          onChanged: (val){
                            print(val);
                          },

                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    'Next Day Delivery',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children:
                    [
                      Expanded(
                        child: Text(
                          'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 13.0
                          ),
                        ),
                      ),
                      Radio(
                          value: 1,
                          groupValue: 1,
                          onChanged: (val){
                            print(val);
                          }
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    'Nominated Delivery',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children:
                    [
                      Expanded(
                        child: Text(
                          'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 13.0
                          ),
                        ),
                      ),
                      Radio(
                          value: 1,
                          groupValue: 1,
                          onChanged: (val){
                            print(val);
                          }
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
