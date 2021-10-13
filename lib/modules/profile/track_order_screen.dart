
import 'package:e_commerce_app/modules/profile/profile_screen.dart';
import 'package:e_commerce_app/shared/components/components.dart';
import 'package:e_commerce_app/shared/components/custom_text.dart';
import 'package:e_commerce_app/shared/helper/constance.dart';
import 'package:flutter/material.dart';

import 'orders_details_track_screen.dart';

class TrackOrderScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        toolbarHeight: 80.0,
        leading: GestureDetector(
          onTap: () {
            navigateAndFinish(context, ProfileScreen());
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Text('Track Order'),
        centerTitle: true,
      ),
      body: ListView.separated(
          itemBuilder: (context , index) => _buildOrderInTransitItem(context),
          separatorBuilder: (context , index) => SizedBox(height: 15.0,),
          itemCount: 10
      ),
    );
  }

  Widget _buildOrderInTransitItem(context) => InkWell(
    onTap: (){
      navigateTo(context, OrdersDetailsTrackScreen());
    },
    child: Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
        [
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0,
                top: 10.0
            ),
            child: CustomText(
              text: '21, October, 2021',
              fontSize: 14.0,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(height: 12.0,),
          Padding(
            padding: const EdgeInsets.only(
                left: 8.0
            ),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'OO - 3874975539 - N',
                          fontSize: 15.0,
                        ),
                        SizedBox(height: 5.0,),
                        CustomText(
                          text: '\$ 389',
                          fontSize: 14.0,
                          color: myGreen,
                          alignment: Alignment.topLeft,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          width: 90,
                          color: Colors.amber,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomText(
                              text: 'In Transit',
                              alignment: Alignment.center,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      width: 130.0,
                      child: Image(
                        width: 200.0,
                        fit: BoxFit.fill,
                        image: NetworkImage('https://i.imgur.com/sOzEw8d.png'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );

}