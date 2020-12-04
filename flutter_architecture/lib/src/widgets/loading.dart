import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Align(
      child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            Colors.green,
          ),
          strokeWidth: 5.0),
    );
  }
}
