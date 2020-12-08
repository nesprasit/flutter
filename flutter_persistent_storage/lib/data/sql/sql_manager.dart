import 'package:flutter_persistent_storage/data/sql/sql.dart';
import 'package:flutter_persistent_storage/models/user_model.dart';
import 'package:sqflite/sqflite.dart';

class SqlManager extends Sql {
  static final SqlManager _singleton = SqlManager._internal();
  factory SqlManager() => _singleton;
  SqlManager._internal();

  Future<Database> _instance() async => await Sql.getIntance();

  Future insertUser(UserModel user) async {
    final db = await _instance();

    await db.insert(
      SqlField.TABLE_NAME,
      Map.from({
        SqlField.NICK_NAME: user.nickName,
        SqlField.FIEST_NAME: user.fristName,
        SqlField.LAST_NAME: user.lastName,
        SqlField.AGE: user.age,
      }),
    );
  }

  Future<List<UserModel>> getUsers() async {
    final db = await _instance();

    final users = await db.query(SqlField.TABLE_NAME);
    return users
        .map((e) => UserModel.fromJson(
              Map.from({
                "nick_name": e[SqlField.NICK_NAME],
                "frist_name": e[SqlField.FIEST_NAME],
                "last_name": e[SqlField.LAST_NAME],
                "age": e[SqlField.AGE],
              }),
            ))
        .toList();
  }

  clearUserTable() async {
    final db = await _instance();

    try {
      await db.transaction((txn) async {
        final batch = txn.batch();
        batch.delete(SqlField.TABLE_NAME);
        await batch.commit();
      });
    } catch (error) {
      throw Exception('DbBase.cleanDatabase: ' + error.toString());
    }
  }
}
