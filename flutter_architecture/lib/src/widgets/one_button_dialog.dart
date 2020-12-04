import 'package:flutter/material.dart';
import 'package:flutter_provider/res/colors.dart';
import 'package:provider/provider.dart';

class OneButtonDialog {
  static final rounteName = 'OneButtonDialog';
  static bool _isShow = false;

  OneButtonDialog.dimiss(BuildContext context) {
    if (_isShow) {
      Navigator.pop(context, rounteName);
    }
    _isShow = false;
  }

  OneButtonDialog.show({
    BuildContext context,
    String title,
    String content,
    String buttonText,
    Function action,
  }) {
    if (!_isShow) {
      Future.delayed(Duration.zero, () {
        showDialog(
          context: context,
          barrierDismissible: false,
          routeSettings: RouteSettings(name: rounteName),
          child: Provider(
            create: (_) => _DialogModel(
              title: title,
              content: content,
              buttonText: buttonText,
              action: action ??
                  () {
                    OneButtonDialog.dimiss(context);
                  },
            ),
            child: _OneButtonDialog(),
          ),
        );
        _isShow = true;
      });
    }
  }
}

class _OneButtonDialog extends Dialog {
  @override
  Color get backgroundColor => Colors.white;

  @override
  double get elevation => 0;

  @override
  Widget get child => Consumer<_DialogModel>(
      builder: (context, value, child) => _OneOneButtonWidget(model: value));

  @override
  ShapeBorder get shape => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      );
}

class _OneOneButtonWidget extends Stack {
  _DialogModel model;

  _OneOneButtonWidget({this.model});

  @override
  AlignmentGeometry get alignment => Alignment.topCenter;

  @override
  List<Widget> get children => [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            model?.title?.isNotEmpty == true
                ? Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      model.title ?? '',
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                : Container(),
            model?.content?.isNotEmpty == true
                ? Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: Text(
                      model.content ?? '',
                      style: TextStyle(fontSize: 14),
                    ),
                  )
                : Container(),
            Container(
              width: 100,
              padding: const EdgeInsets.only(top: 10, bottom: 7),
              child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  onPressed: model?.action ?? null,
                  color: color_primary.withOpacity(0.9),
                  child: Text(
                    model.buttonText ?? 'OK',
                    style: TextStyle(
                      fontSize: 14,
                      color: color_white,
                    ),
                  )),
            ),
          ],
        )
      ];
}

class _DialogModel {
  String title;
  String content;
  String buttonText;
  Function action;

  _DialogModel({this.title, this.content, this.buttonText, this.action});
}
