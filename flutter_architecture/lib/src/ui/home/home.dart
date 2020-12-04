import 'package:flutter/material.dart';
import 'package:flutter_provider/res/colors.dart';
import 'package:flutter_provider/res/sizes.dart';
import 'package:flutter_provider/src/di/service_locator.dart';
import 'package:flutter_provider/src/models/todo/todolist_response_model.dart';
import 'package:flutter_provider/src/remote/response_result.dart';
import 'package:flutter_provider/src/ui/home/home_model.dart';
import 'package:flutter_provider/src/ui/home/home_viewmodel.dart';
import 'package:flutter_provider/src/widgets/base_appbar.dart';
import 'package:flutter_provider/src/widgets/expansion.dart';
import 'package:flutter_provider/src/widgets/loading_dialog.dart';
import 'package:flutter_provider/src/widgets/one_button_dialog.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider<HomeTodoListData>.value(
            value: HomeTodoListData(),
          )
        ],
        child: _Home(),
      );
}

class _Home extends Scaffold {
  final baseAppBar = BaseAppBarWidget(title: '');

  _Home() {
    _init();
    _initEvent();
  }

  @override
  PreferredSizeWidget get appBar => AppBar(
        flexibleSpace: baseAppBar,
        automaticallyImplyLeading: false,
      );

  @override
  Widget get body => Container(
        color: color_primary.withOpacity(0.05),
        child: _HomeList(),
      );

  _init() {
    baseAppBar.setRightEnabled(true);
    baseAppBar.setRightIconData(FontAwesomeIcons.plus);
  }

  _initEvent() {
    baseAppBar.onLeftClickListener = () {};

    baseAppBar.onRightClickListener = () {};
  }
}

class _HomeList extends Container {
  BuildContext _context;
  final viewModel = serviceLocator<HomeViewModel>();

  @override
  Widget build(BuildContext context) {
    this._context = context;
    _init();

    return Consumer<HomeTodoListData>(
      builder: (context, value, child) {
        this._context = context;

        return RefreshIndicator(
          onRefresh: _callServiceTodoList,
          child: SafeArea(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return Expansion(
                  expanded: value.data?.elementAt(index)?.isExpanded ?? false,
                  buildHeader: (state) => _HomeListItem(
                    context: context,
                    state: state,
                    index: index,
                    data: value.data?.elementAt(index) ?? null,
                  ),
                  children: _HomeListDetailitem(),
                );
              },
            ),
          ),
        );
      },
    );
  }

  _init() {
    LoadingDialog.show(_context);
    _callServiceTodoList();
  }

  Future _callServiceTodoList() async {
    await viewModel.getTodoList(_obseverTodoList());
  }

  _obseverTodoList() => ResponseResult<TodoListResponseModel>.obsever(
        complete: () => LoadingDialog.dimiss(_context),
        success: (model) {
          _context
              .read<HomeTodoListData>()
              .setData(model.data.map((e) => TodoListData(data: e)).toList());
        },
        error: (message, code) {
          OneButtonDialog.show(
            context: _context,
            content: '$message ($code)',
          );
        },
      );
}

class _HomeListItem extends Card {
  final ExpansionState state;
  final TodoListData data;
  final BuildContext context;
  final int index;

  _HomeListItem({
    this.context,
    this.state,
    this.index,
    this.data,
  });

  @override
  Color get color => Colors.white;

  @override
  ShapeBorder get shape =>
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(px3));

  @override
  EdgeInsetsGeometry get margin =>
      const EdgeInsets.only(top: px4, left: px4, right: px4);

  @override
  Widget get child => InkWell(
        onTap: () => {},
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _titleItem(),
                  _subTitleItem(),
                ],
              ),
            ),
            _editItem(),
            _detailItem(),
          ],
        ),
      );

  Widget _titleItem() => Padding(
        padding: const EdgeInsets.only(top: px7, left: px16, right: px16),
        child: Text(
          '${data?.data?.title ?? ''} $index' ?? '',
          style: TextStyle(fontSize: px18),
        ),
      );

  Widget _subTitleItem() => Padding(
        padding: const EdgeInsets.only(left: px16, right: px16, bottom: px7),
        child: Text(
          '${data?.data?.detail ?? ''} $index' ?? '',
          style: TextStyle(fontSize: px14),
        ),
      );
  Widget _editItem() => Padding(
        padding: const EdgeInsets.only(right: px1),
        child: IconButton(
          splashRadius: px21,
          icon: FaIcon(
            FontAwesomeIcons.edit,
            size: px18,
            color: color_primary.withOpacity(0.5),
          ),
          onPressed: () {},
        ),
      );

  Widget _detailItem() => Padding(
        padding: const EdgeInsets.only(right: px1),
        child: IconButton(
          splashRadius: px21,
          icon: FaIcon(
            FontAwesomeIcons.chevronDown,
            size: px18,
            color: color_primary.withOpacity(0.5),
          ),
          onPressed: () {
            data.isExpanded = !data.isExpanded;
            state.expanded(data.isExpanded);
            context.read<HomeTodoListData>().updateItem(index, data);
          },
        ),
      );
}

class _HomeListDetailitem extends Container {
  @override
  AlignmentGeometry get alignment => Alignment.centerLeft;

  @override
  Color get color => Colors.white.withOpacity(0.9);

  @override
  EdgeInsetsGeometry get margin =>
      const EdgeInsets.only(top: px2, left: px4, right: px4);

  @override
  Widget get child => Padding(
        padding: const EdgeInsets.only(
          left: px16,
          right: px16,
          top: px7,
          bottom: px7,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('date'),
                  Text('attach'),
                ],
              ),
            ),
            Expanded(
              flex: 0,
              child: Padding(
                padding: const EdgeInsets.only(left: px7, right: px7),
                child: Column(
                  children: [
                    Text(':'),
                    Text(':'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('20 มกราคม 2563'),
                  FaIcon(FontAwesomeIcons.paperclip, size: px16),
                ],
              ),
            )
          ],
        ),
      );
}
