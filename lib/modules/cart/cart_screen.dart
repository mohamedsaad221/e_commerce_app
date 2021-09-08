import 'package:e_commerce_app/shared/components/custom_button.dart';
import 'package:e_commerce_app/shared/components/custom_slidable_actions.dart';
import 'package:e_commerce_app/shared/components/custom_text.dart';
import 'package:e_commerce_app/shared/constance.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20.0
              ),
              child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return SlidableWidget(
                        child: builtCartItem(),
                    );
                  },
                  separatorBuilder: (context , index) => SizedBox(
                    height: 15.0,
                  ),
                  itemCount: 10
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      CustomText(
                        text: 'Total',
                        fontSize: 16.0,
                        color: Colors.grey.shade400,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      CustomText(
                        text: '\$4200',
                        fontSize: 20.0,
                        color: primaryColor,
                      ),
                    ],
                  ),
                ),
                CustomButton(
                  onPressed: () {},
                  text: 'Checkout',
                )
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget builtCartItem() => Container(
    height: 120,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            width: 200.0,
            padding: EdgeInsetsDirectional.only(
              start: 10.0
            ),
            child: Image(
              width: 200.0,
              fit: BoxFit.cover,
              image: NetworkImage(
                'https://eg.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/06/865351/1.jpg?2528',
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: 'tag heuer wristwatch',
                fontWeight: FontWeight.w600,
                fontSize: 15.0,
              ),
              SizedBox(
                height: 5.0,
              ),
              CustomText(
                text: '\$1260',
                fontSize: 16.0,
                color: primaryColor,
              ),
              SizedBox(
                height: 20.0,
              ),
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
                        onTap: () {},
                        child: Icon(
                          Icons.add,
                          size: 16.0,
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      CustomText(
                        text: '1',
                        alignment: Alignment.center,
                        fontSize: 20.0,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding:
                              EdgeInsetsDirectional.only(bottom: 10.0),
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
