import 'package:flutter/material.dart';
import 'package:flutter_persistent_storage/managers/sql/sql_manager.dart';
import 'package:flutter_persistent_storage/models/user_model.dart';
import 'package:flutter_persistent_storage/ui/form/form_dialog.dart';

class ScreenSql extends StatefulWidget {
  @override
  _ScreenSqlState createState() => _ScreenSqlState();
}

class _ScreenSqlState extends State<ScreenSql> {
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
            title: Text(
              "Screen Sqflite",
              style: TextStyle(fontSize: 14),
            ),
            actions: [
              FlatButton(
                onPressed: () {
                  setState(() {
                    SqlManager().clearUserTable();
                    _getUsers();
                  });
                },
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              )
            ]),
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
        ));
  }

  _getUsers() async {
    final users = await SqlManager().getUsers();
    setState(() {
      if (users.isNotEmpty) {
        lists.addAll(users);
      } else {
        lists = [];
      }
    });
  }

  _saveUsers(String nickName, String firstName, String lastName) async {
    final user = UserModel(
      nickName: nickName,
      fristName: firstName,
      lastName: lastName,
    );

    await SqlManager().insertUser(user);

    setState(() {
      lists.add(user);
    });
  }
}
