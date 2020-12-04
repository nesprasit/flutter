import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class BaseAppBarWidget extends StatelessWidget {
  BuildContext context;
  String title = '';
  Function onLeftClickListener;
  Function onRightClickListener;

  _RightViewModel _rightViewModel = _RightViewModel();
  _LeftViewModel _leftViewModel = _LeftViewModel();

  BaseAppBarWidget({
    @required this.title,
    this.onLeftClickListener,
    this.onRightClickListener,
  });

  updateTitle(String title) {
    context?.read<_TitleViewModel>()?.update(title);
  }

  setRightLabel(String label) {
    _rightViewModel.label = label;
  }

  setRightIconData(IconData iconData) {
    _rightViewModel.iconData = iconData;
  }

  setRightEnabled(bool enabled) {
    _rightViewModel.enable = enabled;
  }

  setLeftIconData(IconData iconData) {
    _leftViewModel.iconData = iconData;
  }

  setLeftEnabled(bool enabled) {
    _leftViewModel.enable = enabled;
  }

  updateRightLabel(String label) {
    context?.read<_RightViewModel>()?.setLabal(label);
  }

  updateRightIconData(IconData iconData) {
    context?.read<_RightViewModel>()?.setIconData(iconData);
  }

  updateRightEnabled(bool enabled) {
    context?.read<_RightViewModel>()?.setEnabled(enabled);
  }

  updateLeftIconData(IconData iconData) {
    context?.read<_LeftViewModel>()?.setIconData(iconData);
  }

  updateLeftEnabled(bool enabled) {
    context?.read<_LeftViewModel>()?.setEnabled(enabled);
  }

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: _TitleViewModel(title)),
          ChangeNotifierProvider.value(value: _leftViewModel),
          ChangeNotifierProvider.value(value: _rightViewModel)
        ],
        child: Builder(
          builder: (context) {
            this.context = context;
            return _BaseAppBarWidget(widget: this);
          },
        ),
      );
}

class _BaseAppBarWidget extends Align {
  final BaseAppBarWidget widget;
  final _appBar = AppBar();

  _BaseAppBarWidget({this.widget});

  @override
  Widget get child => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          color: Colors.transparent,
          height: _appBar.preferredSize.height,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Consumer<_LeftViewModel>(
                      builder: (context, value, child) =>
                          LeftWidget(widget: widget, viewModel: value))),
              Expanded(flex: 3, child: CenterWidget(widget: widget)),
              Expanded(
                  child: Consumer<_RightViewModel>(
                      builder: (context, value, child) =>
                          RightWidget(widget: widget, viewModel: value)))
            ],
          ),
        ),
      );
}

class CenterWidget extends Container {
  final BaseAppBarWidget widget;

  CenterWidget({@required this.widget});

  @override
  BoxConstraints get constraints => BoxConstraints.expand();

  @override
  Widget get child => Align(
        child: Consumer<_TitleViewModel>(
          builder: (context, viewModel, child) => Text(
            viewModel.value,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      );
}

class LeftWidget extends InkWell {
  final _LeftViewModel viewModel;
  final BaseAppBarWidget widget;

  LeftWidget({@required this.widget, @required this.viewModel});

  @override
  ShapeBorder get customBorder => CircleBorder();

  @override
  get onTap =>
      (viewModel?.enable ?? false) && (widget.onLeftClickListener != null)
          ? () {
              widget.onLeftClickListener?.call();
            }
          : null;

  @override
  Widget get child => Container(
        constraints: BoxConstraints.expand(),
        child: Align(
          child: viewModel.iconData != null
              ? Icon(FontAwesomeIcons.chevronLeft, color: Colors.white)
              : Container(),
        ),
      );
}

class RightWidget extends InkWell {
  final _RightViewModel viewModel;
  final BaseAppBarWidget widget;

  RightWidget({@required this.widget, @required this.viewModel});

  @override
  ShapeBorder get customBorder => CircleBorder();

  @override
  get onTap =>
      (viewModel?.enable ?? false) && (widget.onRightClickListener != null)
          ? () {
              widget.onRightClickListener?.call();
            }
          : null;

  @override
  Widget get child {
    final color =
        Colors.white.withOpacity((viewModel.enable ?? false) ? 1 : 0.5);

    return Container(
        constraints: BoxConstraints.expand(),
        child: Align(
          child: viewModel.label != null
              ? Text(
                  viewModel.label,
                  style: TextStyle(color: color, fontSize: 16),
                )
              : viewModel.iconData != null
                  ? Icon(viewModel.iconData, color: color)
                  : Container(),
        ));
  }
}

class _TitleViewModel extends ValueNotifier<String> {
  _TitleViewModel(String value) : super(value);

  update(String title) {
    this.value = title;
    this.notifyListeners();
  }
}

class _LeftViewModel extends ChangeNotifier {
  bool enable;
  IconData iconData;

  _LeftViewModel({this.enable, this.iconData});

  setEnabled(bool enable) {
    this.enable = enable;
    this.notifyListeners();
  }

  setIconData(IconData iconData) {
    this.iconData = iconData;
    this.notifyListeners();
  }
}

class _RightViewModel extends ChangeNotifier {
  bool enable;
  String label;
  IconData iconData;

  _RightViewModel({this.enable, this.label, this.iconData});

  setEnabled(bool enable) {
    this.enable = enable;
    this.notifyListeners();
  }

  setLabal(String label) {
    this.label = label;
    this.notifyListeners();
  }

  setIconData(IconData iconData) {
    this.iconData = iconData;
    this.notifyListeners();
  }
}
