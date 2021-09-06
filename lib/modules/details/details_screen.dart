import 'package:e_commerce_app/shared/components/custom_button.dart';
import 'package:e_commerce_app/shared/components/custom_text.dart';
import 'package:e_commerce_app/shared/constance.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: size.height * 0.3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://firebasestorage.googleapis.com/v0/b/commerceapp-ad96e.appspot.com/o/shirt.png?alt=media&token=b9ab6d50-25c3-4618-ae0c-747e6ad96e4e',
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios),
                      ),
                      FloatingActionButton(
                        onPressed: () {},
                        backgroundColor: Colors.white,
                        child: Icon(Icons.star_border_outlined),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.0),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        CustomText(
                          text: 'Nike Dri-FIT Long Sleeve',
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          alignment: Alignment.center,
                        ),
                        SizedBox(height: 25.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              padding: EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(width: 1.0, color: myGrey),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CustomText(
                                    text: 'Size',
                                    fontSize: 14,
                                    alignment: Alignment.centerLeft,
                                  ),
                                  CustomText(
                                    text: 'XL',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    alignment: Alignment.centerRight,
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              padding: EdgeInsets.all(14.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(width: 1.0, color: myGrey),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CustomText(
                                    text: 'Colour',
                                    fontSize: 14,
                                    alignment: Alignment.centerLeft,
                                  ),
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: HexColor("#31407B"),
                                      borderRadius: BorderRadius.circular(7.0),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        CustomText(
                          text: 'Details',
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          height: 1.5,
                        ),
                        SizedBox(height: 10),
                        CustomText(
                          text:
                              'Nike Dri-FIT is a polyester fabric designed to help you keep dry so you can more comfortably work harder, longer.\nNike Dri-FIT is a polyester fabric designed to help you keep dry so you can more comfortably work harder, longer.\nNike Dri-FIT is a polyester fabric designed to help you keep dry so you can more comfortably work harder, longer.\n',
                          fontSize: 14,
                          height: 2.2,
                        ),
                      ],
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 15.0,
                left: 15.0,
                right: 15.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'PRICE',
                          color: Colors.grey,
                          fontSize: 12,
                          alignment: Alignment.centerLeft,
                          height: 1.5,
                        ),
                        CustomText(
                          text: '\$1500',
                          color: primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          alignment: Alignment.centerLeft,
                          height: 1.5,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 190,
                      height: 100,
                      padding: EdgeInsets.all(25),
                      child: CustomButton(
                        onPressed: () => {},
                        text: 'ADD',
                        radius: 5,
                        padding: 5,
                      ),
                    ),
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
