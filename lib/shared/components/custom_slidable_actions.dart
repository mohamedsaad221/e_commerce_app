import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class SlidableWidget<T> extends StatelessWidget {
  final Widget? child;
  final Function()? onLeftTap;
  final Function()? onRightTap;


  const SlidableWidget({
    required this.child,
    required this.onLeftTap,
    required this.onRightTap,
  });

  @override
  Widget build(BuildContext context) => Slidable(
    actionPane: SlidableDrawerActionPane(),
   child: child!,




    /// left side
    actions: <Widget>[
      IconSlideAction(
        color: Colors.amber,
        icon: Icons.star,
        foregroundColor: Colors.white,
        onTap: onLeftTap,
      ),
    ],

    /// right side
    secondaryActions: <Widget>[
      IconSlideAction(
        color: Colors.red,
        icon: Icons.delete,
        onTap: onRightTap,
      ),
    ],
  );
}