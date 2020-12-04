import 'package:flutter/material.dart';

class BoxElevation extends BoxShadow {

  @override
  Color get color => Colors.grey.withOpacity(0.3);

  @override
  double get blurRadius => 1;

  @override
  Offset get offset => Offset(0, 2);
}
