import 'package:flutter/material.dart';
import 'package:flutter_provider/src/widgets/loading.dart';

class LoadingDialog {
  static final rounteName = 'LoadingDialog';
  static bool _isShow = false;

  LoadingDialog.dimiss(BuildContext context) {
    if (_isShow) {
      Navigator.pop(context);
    }
    _isShow = false;
  }

  LoadingDialog.show(BuildContext context) {
    if (!_isShow) {
      Future.delayed(Duration.zero, () {
        showDialog(
          context: context,
          barrierDismissible: false,
          routeSettings: RouteSettings(name: rounteName),
          child: _LoadingDialog(),
        );

        _isShow = true;
      });
    }
  }
}

class _LoadingDialog extends Dialog {
  @override
  Color get backgroundColor => Colors.transparent;

  @override
  double get elevation => 0;

  @override
  Widget get child => Loading();
}
