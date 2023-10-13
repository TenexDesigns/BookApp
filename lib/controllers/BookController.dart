import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/Book.dart';
import '../services/BookService.dart';



class BookController extends GetxController {
  final dbHelper = DatabaseHelper();
  final books = <Book>[].obs;



  @override
  void onInit() async {
    await dbHelper.open();
    await _refreshBookList();
    super.onInit();
  }

  Future<void> _refreshBookList() async {
    final list = await dbHelper.getBooks();
    books.clear();
    books.addAll(list);
  }

  Future<List<Book>> getBooks() async{
    final list = await dbHelper.getBooks();
    books.clear();
    books.addAll(list);
    return books;



  }



  Future<void> insertBook(Book newBook) async {
    try {
      await dbHelper.insertBook(newBook);
      _refreshBookList();
      Get.snackbar('Success', 'Book added successfully',snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.lightGreenAccent, duration: Duration(seconds: 1),margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15));
    } catch (e) {
      Get.snackbar('Error', 'Failed to add book: $e');
    }
  }


  // Future<void> insertBook(Book newBook) async {
  //   await dbHelper.insertBook(newBook);
  //   _refreshBookList();
  // }

  Future<void> updateBook(Map<String, dynamic> updatedBook) async {

    try {
      await dbHelper.updateBook(updatedBook);
      _refreshBookList();
      Get.snackbar(
        'Success',
        'Book updated successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.lightGreenAccent,
        duration: Duration(seconds: 1),
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      );
    } catch (e) {
      Get.snackbar('Error', 'Failed to update book: $e');
    }
  }



  Future<void> deleteBook(int id) async {
    try{
      await dbHelper.deleteBook(id);
      _refreshBookList();

      Get.snackbar('Successfuly Deleted', 'Book Deleted successfully',snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.deepOrange, duration: Duration(seconds: 1),margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15));

    }

    catch(e){

    }
  }



  // Future<void> updateBook({required int id, String? title, int? pages}) async {
  //   final updatedBook = Book(id: id, title: title, pages: pages);
  //   try {
  //     await dbHelper.updateBook(updatedBook);
  //     _refreshBookList();
  //     Get.snackbar(
  //       'Success',
  //       'Book updated successfully',
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.lightGreenAccent,
  //       duration: Duration(seconds: 1),
  //       margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
  //     );
  //   } catch (e) {
  //     Get.snackbar('Error', 'Failed to update book: $e');
  //   }
  // }
  //


}