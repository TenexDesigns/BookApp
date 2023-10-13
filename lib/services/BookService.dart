import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../model/Book.dart';

class DatabaseHelper {

  late Database _database;

  Future<void> open() async {
    try {
      final appDocumentDirectory = await getApplicationDocumentsDirectory();
      final databasePath = '${appDocumentDirectory.path}/books.db';
      _database =
      await openDatabase(databasePath, version: 1, onCreate: _onCreate);
    }catch(e){
      Get.snackbar('Error', 'Failed to add book: $e');

    }
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE books(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        pages INTEGER
      )
    ''');
  }

  Future<int> insertBook(Book book) async {
    return await _database.insert('books', book.toMap());
  }

  Future<List<Book>> getBooks() async {
    final List<Map<String, dynamic>> maps = await _database.query('books');

    return maps.map((json) => Book.fromMap(json)).toList();

  }

  Future<int> updateBook(Map<String,dynamic>  book) async {
    Map<String, dynamic> valuesToUpdate = {};

    if (book["title"] != null) {
      valuesToUpdate['title'] = book["title"];
    }

    if (book["pages"] != null) {
      valuesToUpdate['pages'] = book["pages"];
    }

    return await _database.update(
      'books',
      valuesToUpdate,
      where: 'id = ?',
      whereArgs: [book["id"]],
    );
  }


  Future<int> deleteBook(int id) async {
    return await _database.delete(
      'books',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}