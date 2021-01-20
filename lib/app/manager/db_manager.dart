import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:testapp/modules/userList/model/user.dart';

class DatabaseManager {

  static DatabaseManager get = DatabaseManager();

  Future<Database> database;

  void initDb() async {
    WidgetsFlutterBinding.ensureInitialized();
    database = openDatabase(
      join(await getDatabasesPath(), 'users_database.db'), version: 1,
      onCreate: (db, version) {
        return db.execute("CREATE TABLE users(id INTEGER PRIMARY KEY, email TEXT, first_name TEXT, last_name TEXT, avatar TEXT, page INTEGER)");
      },
    );
  }

  // MARK: - Insert 'USER'
  Future<void> insertUser(User user, int page) async {
    final Database db = await database;
    await db.insert('users', user.toMap(page),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<User>> getUsers(int page) async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('users');
    return List.generate(maps.length, (i) {
      return User.fromJson(maps[i]);
    });
  }

  void deleteUsers() async {
    final Database db = await database;
    await db.delete('users');
  }

}