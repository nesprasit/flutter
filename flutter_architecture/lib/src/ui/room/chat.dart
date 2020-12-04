import 'package:flutter/material.dart';
import 'package:flutter_provider/res/colors.dart';
import 'package:flutter_provider/res/sizes.dart';
import 'package:flutter_provider/src/widgets/base_appbar.dart';
import 'package:flutter_provider/src/widgets/elevation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Chat extends StatefulWidget {
  final _listScrollController = ScrollController();
  final _baseAppBar = BaseAppBarWidget(title: 'Chat Room');

  @override
  State<StatefulWidget> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: widget._baseAppBar,
      ),
      body: _ChatScreen(widget),
    );
  }
}

class _ChatScreen extends Container {
  Chat widget;

  _ChatScreen(this.widget);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: color_primary.withOpacity(0.5),
        child: Stack(
          children: [
            Column(
              children: [
                Flexible(
                  child: buidListMessages(),
                ),
                buildInput()
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buidListMessages() => ListView.builder(
        padding: const EdgeInsets.only(left: px10, right: px10),
        reverse: true,
        controller: widget._listScrollController,
        itemBuilder: buidItem,
        itemCount: 30,
      );

  Widget buildInput() => Container(
        padding: const EdgeInsets.only(
            top: px7, bottom: px7, left: px16, right: px16),
        color: Colors.white,
        child: Row(
          children: [
            Flexible(
              child: Container(
                color: Colors.lime,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Text message.....',
                    hintStyle: TextStyle(color: color_grey),
                  ),
                ),
              ),
            ),
            FlatButton(
              minWidth: 50,
              height: 50,
              shape:CircleBorder(),
              child: Icon(FontAwesomeIcons.cat),
              onPressed: () {},
            )
          ],
        ),
      );

  Widget buidItem(BuildContext context, int index) {
    return Container(
      child: (() {
        switch (index) {
          case 1:
            return buidMessageItem(Alignment.centerLeft);
          default:
            return buidMessageItem(Alignment.centerRight);
        }
      }()),
    );
  }

  Widget buidMessageItem(Alignment alignment) => Container(
        padding: const EdgeInsets.only(
          top: px7,
          bottom: px7,
          left: px6,
          right: px6,
        ),
        color: Colors.transparent,
        alignment: alignment,
        margin: const EdgeInsets.only(top: px4, bottom: px4),
        child: false ? BoxMessage(
          padding: const EdgeInsets.only(
              left: px16, right: px16, top: px7, bottom: px7),
          child: Text('aaaaa'),
        ): null,
      );
}

class BoxMessage extends Container {
  Widget _child;
  EdgeInsetsGeometry _padding;

  BoxMessage({
    EdgeInsetsGeometry padding,
    Widget child,
  }) {
    this._padding = padding;
    this._child = child;
  }

  @override
  EdgeInsetsGeometry get padding => _padding;

  @override
  Decoration get decoration => BoxDecoration(
        boxShadow: [BoxElevation()],
        color: Colors.blue.withOpacity(1),
        borderRadius: BorderRadius.circular(px18),
      );

  @override
  Widget get child => _child;
}
