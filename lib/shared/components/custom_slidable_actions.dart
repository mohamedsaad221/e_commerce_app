import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class SlidableWidget<T> extends StatelessWidget {
  final Widget? child;


  const SlidableWidget({
    required this.child,
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
        onTap: () {},
      ),
    ],

    /// right side
    secondaryActions: <Widget>[
      IconSlideAction(
        color: Colors.red,
        icon: Icons.delete,
        onTap: () {},
      ),
    ],
  );
}