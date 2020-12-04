import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Expansion extends StatelessWidget {
  Widget Function(ExpansionState state) buildHeader;
  final Widget children;
  final Alignment expandedAlignment;
  final bool expanded;

  Expansion({
    @required this.buildHeader,
    this.children,
    this.expandedAlignment,
    this.expanded = false,
  });

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider.value(
        value: _AnimationChange(),
        child: _Expansion(
          buildHeader: buildHeader,
          children: children,
          expandedAlignment: expandedAlignment,
          expanded: expanded,
        ),
      );
}

class _Expansion extends StatefulWidget {
  Widget Function(ExpansionState state) buildHeader;
  final Widget children;
  final Alignment expandedAlignment;
  final bool expanded;

  _Expansion({
    @required this.buildHeader,
    this.children,
    this.expandedAlignment,
    this.expanded = false,
  });

  @override
  State<StatefulWidget> createState() => _ExpansionState();
}

class _ExpansionState extends State<_Expansion>
    with SingleTickerProviderStateMixin {
  static final _easeInTween = CurveTween(curve: Curves.easeIn);

  ExpansionState _expansionState;
  AnimationController _controller;
  Animation<double> _heightFactor;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this);
    _heightFactor = _controller.drive(_easeInTween);
    _controller.value = widget.expanded ? 1 : 0;
    _expansionState = ExpansionState(context: context, controller: _controller);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<_AnimationChange>(
      child: child(),
      builder: (context, value, child) {
        return AnimatedBuilder(
          animation: _controller.view,
          builder: buildHeader,
          child: child,
        );
      },
    );
  }

  Widget buildHeader(BuildContext context, Widget child) {
    return Column(
      children: [
        widget.buildHeader.call(_expansionState),
        ClipRect(
          child: Align(
            alignment: widget.expandedAlignment ?? Alignment.center,
            heightFactor: _heightFactor.value,
            child: child,
          ),
        )
      ],
    );
  }

  Widget child() => Offstage(
        child: TickerMode(
          child: widget.children,
          enabled: widget.expanded,
        ),
        offstage: !widget.expanded,
      );
}

class _AnimationChange extends ChangeNotifier {
  change(Function change) {
    change?.call();
    this.notifyListeners();
  }
}

class ExpansionState {
  final BuildContext context;
  final AnimationController controller;

  ExpansionState({this.context, this.controller});

  expanded(bool expanded) {
    if (expanded) {
      context.read<_AnimationChange>().change(() {
        controller.forward();
      });
    } else {
      context.read<_AnimationChange>().change(() {
        controller.reverse();
      });
    }
  }
}
