import 'package:e_commerce_app/models/cart_product_model.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/modules/cart/cubit/cart_cubit.dart';
import 'package:e_commerce_app/shared/components/custom_button.dart';
import 'package:e_commerce_app/shared/components/custom_text.dart';
import 'package:e_commerce_app/shared/constance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class DetailsScreen extends StatelessWidget {
  final ProductModel _product;

  DetailsScreen(this._product);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: size.width,
                    height: size.height * 0.4,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          _product.image!,
                        ),
                        fit: BoxFit.cover,
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
            ),
            SizedBox(height: 15.0),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        CustomText(
                          text: _product.name!,
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
                              height: 50,
                              // padding: EdgeInsets.all(16.0),
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
                                    fontSize: 12,
                                    alignment: Alignment.centerLeft,
                                  ),
                                  CustomText(
                                    text: _product.size!,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    alignment: Alignment.centerRight,
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: 50,
                              // padding: EdgeInsets.all(14.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(width: 1.0, color: myGrey),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CustomText(
                                    text: 'Color',
                                    fontSize: 14,
                                    alignment: Alignment.centerLeft,
                                  ),
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: HexColor('${_product.color}'),
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
                          text: _product.description!,
                          fontSize: 14,
                          height: 2.2,
                        ),
                      ],
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      width: 190,
                      height: 85,
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: 'PRICE',
                            color: Colors.grey,
                            fontSize: 16,
                            alignment: Alignment.centerLeft,
                            height: 1.5,
                          ),
                          CustomText(
                            text: '\$' + _product.price!,
                            color: primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            alignment: Alignment.centerLeft,
                            height: 1.5,
                          ),
                        ],
                      ),
                    ),
                  ),
                  BlocConsumer<CartCubit, CartState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return Container(
                        width: 190,
                        height: 85,
                        padding: EdgeInsets.all(15),
                        child: CustomButton(
                          onPressed: () {
                            print('_product.productId = ${_product.productId}');
                            CartCubit.get(context).insertToDatabase(
                              CartProductModel(
                                name: _product.name,
                                image: _product.image,
                                price: _product.price,
                                quantity: 1,
                                productId: _product.productId,
                              ),
                            );
                          },
                          text: 'ADD',
                          radius: 4,
                        ),
                      );
                    },
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
