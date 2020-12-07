import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_persistent_storage/ui/form/form_dialog.dart';
import 'package:flutter_persistent_storage/ui/sharedpref/shared_pref_manager_imlp.dart';

class ScreenSharedPref extends StatefulWidget {
  @override
  _ScreenSharedPrefState createState() => _ScreenSharedPrefState();
}

class _ScreenSharedPrefState extends State<ScreenSharedPref> {
  List<Map<String, dynamic>> lists = [];

  @override
  void initState() {
    super.initState();
    print('initState');
    _getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen Shared Preferences"),
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
            final nickName = lists.elementAt(index)["nick_name"];
            final firstName = lists.elementAt(index)["first_name"];
            final lastName = lists.elementAt(index)["last_name"];

            return ListTile(
              title: Text('$nickName'),
              subtitle: Text('$firstName $lastName'),
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
    await SharedPrefManagerImlp().clear();
  }

  _getUsers() async {
    await SharedPrefManagerImlp().reload();
    var users = await SharedPrefManagerImlp().getUsers();

    setState(
      () {
        if (users?.isNotEmpty ?? false) {
          lists = (jsonDecode(users) as List<dynamic>)
                  ?.cast<Map<String, dynamic>>() ??
              [];
        } else {
          lists = [];
        }
      },
    );
  }

  _saveUsers(String nickName, String firstName, String lastName) async {
    await SharedPrefManagerImlp().reload();
    var users = await SharedPrefManagerImlp().getUsers();

    List<Map<String, dynamic>> data = [];

    if (users?.isNotEmpty ?? false) {
      final json =
          (jsonDecode(users) as List<dynamic>)?.cast<Map<String, dynamic>>() ??
              [];

      data.addAll(json);
    }

    data.add(Map.from({
      "nick_name": nickName,
      "first_name": firstName,
      "last_name": lastName,
    }));

    final isSave = await SharedPrefManagerImlp().saveUsers(jsonEncode(data));

    if (isSave) {
      await _getUsers();
    }
  }
}
