import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Sql {
  static Completer<Database> _completer;
  static final String _DB = 'user.db';

  static Future<Database> getIntance() async {
    if (_completer == null) {
      _completer = Completer<Database>();
      try {
        Future<Database> openDB = openDatabase(
          join(await getDatabasesPath(), _DB),
          onCreate: (db, version) {
            return db.execute(SqlCommand.CREATE_TABLE);
          },
          version: 1,
        );

        _completer.complete(openDB);
      } on Exception catch (e) {
        // If there's an error, explicitly return the future with an error.
        // then set the completer to null so we can retry.
        _completer.completeError(e);
        final Future<Database> openDB = _completer.future;
        _completer = null;
        return openDB;
      }
    }

    return _completer.future;
  }
}

class SqlCommand {
  static const CREATE_TABLE = "" +
      "CREATE TABLE ${SqlField.TABLE_NAME}" +
      "(${SqlField.ID} INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL," +
      "${SqlField.NICK_NAME} TEXT, " +
      "${SqlField.FIEST_NAME} TEXT, " +
      "${SqlField.LAST_NAME} TEXT, " +
      "${SqlField.AGE} INTEGER)";
}

class SqlField {
  static const TABLE_NAME = "USERS";
  static const ID = "ID";
  static const NICK_NAME = "NICK_NAME";
  static const FIEST_NAME = "FIRST_NAME";
  static const LAST_NAME = "LAST_NAME";
  static const AGE = "AGE";
}
