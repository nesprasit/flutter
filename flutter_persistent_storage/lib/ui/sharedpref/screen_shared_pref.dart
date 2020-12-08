import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_persistent_storage/managers/shared_pref/shared_pref_manager.dart';
import 'package:flutter_persistent_storage/models/user_model.dart';
import 'package:flutter_persistent_storage/ui/form/form_dialog.dart';

class ScreenSharedPref extends StatefulWidget {
  @override
  _ScreenSharedPrefState createState() => _ScreenSharedPrefState();
}

class _ScreenSharedPrefState extends State<ScreenSharedPref> {
  List<UserModel> lists = [];

  @override
  void initState() {
    super.initState();
    _getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text("Screen Shared Preferences", style: TextStyle(fontSize: 14)),
        actions: [
          FlatButton(
            onPressed: () {
              setState(() {
                _delete();
                _getUsers();
              });
            },
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: lists.length,
          itemBuilder: (context, index) {
            final model = lists.elementAt(index) ?? UserModel();
            return ListTile(
              title: Text('${model.nickName}'),
              subtitle: Text('${model.fristName} ${model.lastName}'),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FormDialog.show(
            context: context,
            submit: (nickName, firstName, lastName) {
              _saveUsers(nickName, firstName, lastName);
            },
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }

  _delete() async {
    await SharedPrefManager().clear();
  }

  _getUsers() async {
    final users = await SharedPrefManager().getUsers();

    setState(
      () {
        if (users?.isNotEmpty ?? false) {
          List userList = json.decode(users);
          lists = userList.map((e) => UserModel.fromJson(e)).toList();
        } else {
          lists = [];
        }
      },
    );
  }

  _saveUsers(String nickName, String firstName, String lastName) async {
    await SharedPrefManager().reload();
    var users = await SharedPrefManager().getUsers();

    List<UserModel> data = [];

    if (users?.isNotEmpty ?? false) {
      List userList = (json.decode(users) as List<dynamic>);
      data.addAll(userList.map((e) => UserModel.fromJson(e)).toList());
    }

    final user = UserModel(
      nickName: nickName,
      fristName: firstName,
      lastName: lastName,
    );

    data.add(user);
    final isSave = await SharedPrefManager().saveUsers(jsonEncode(data));

    if (isSave) {
      setState(() {
        lists.add(user);
      });
    }
  }
}
