import 'package:flutter/material.dart';

class ContainerBody extends Container {
  final child;

  ContainerBody({this.child})
      : super(
          margin: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
          child: child,
        );
}
