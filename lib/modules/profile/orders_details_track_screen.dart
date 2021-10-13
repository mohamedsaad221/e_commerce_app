import 'package:e_commerce_app/modules/checkout/cubit/cubit.dart';
import 'package:e_commerce_app/modules/checkout/cubit/state.dart';
import 'package:e_commerce_app/modules/profile/track_order_screen.dart';
import 'package:e_commerce_app/shared/components/components.dart';
import 'package:e_commerce_app/shared/components/custom_button.dart';
import 'package:e_commerce_app/shared/helper/constance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:status_change/status_change.dart';

class OrdersDetailsTrackScreen extends StatelessWidget {
  const OrdersDetailsTrackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckoutCubit, CheckoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = CheckoutCubit.get(context);
        var size = MediaQuery.of(context).size;
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white,
            toolbarHeight: 80.0,
            leading: GestureDetector(
              onTap: () {
                navigateAndFinish(context, TrackOrderScreen());
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
            title: Text('OO - 3874975539 - N'),
            centerTitle: true,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  height: size.height * 0.9,
                  child: StatusChange.tileBuilder(
                    theme: StatusChangeThemeData(
                      direction: Axis.vertical,
                      connectorTheme:
                      ConnectorThemeData(space: 1.0, thickness: 1.0),
                    ),
                    builder: StatusChangeTileBuilder.connected(
                      itemWidth: (_) =>
                      size.height * 0.8 / _processes.length,
                      contentWidgetBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            '${_content[index]}',
                            style: TextStyle(
                              color: Colors
                                  .blue, // change color with dynamic color --> can find it with example section
                            ),
                          ),
                        );
                      },
                      nameWidgetBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            '${_processes[index]}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: cubit.getColor(index),
                            ),
                          ),
                        );
                      },
                      indicatorWidgetBuilder: (_, index) {
                        if (index <= cubit.index) {
                          return DotIndicator(
                            size: 35.0,
                            border: Border.all(color: Colors.green, width: 1),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          );
                        } else {
                          return OutlinedDotIndicator(
                            size: 30,
                            borderWidth: 1.0,
                            color: todoColor,
                          );
                        }
                      },
                      lineWidgetBuilder: (index) {
                        if (index > 0) {
                          if (index == cubit.index) {
                            final prevColor = cubit.getColor(index - 1);
                            final color = cubit.getColor(index);
                            var gradientColors;
                            gradientColors = [
                              prevColor,
                              (Color.lerp(prevColor, color, 0.5))!
                            ];
                            return DecoratedLineConnector(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: gradientColors,
                                ),
                              ),
                            );
                          } else {
                            return SolidLineConnector(
                              color: cubit.getColor(index),
                            );
                          }
                        } else {
                          return null;
                        }
                      },
                      itemCount: _processes.length,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

final _processes = [
  'Order Signed',
  'Order Processed',
  'Shipped ',
  'Out for delivery ',
  'Delivered ',
];

final _content = [
  '20/18',
  '20/18',
  '20/18',
  '20/18',
  '20/18',
];
