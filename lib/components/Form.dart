import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/BookController.dart';
import '../model/Book.dart';




class MyForm2 extends StatefulWidget {



  @override
  State<MyForm2> createState() => _MyForm2State();
}

class _MyForm2State extends State<MyForm2> {

  final BookController bookController = Get.put(BookController());


  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _pagesController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _pagesController.dispose();
    super.dispose();
  }

  // ElevatedButton(
  // onPressed: () async {
  // final newBook = Book(title: 'Flutter Book', pages: 300);
  // await bookController.insertBook(newBook); // Use GetX controller for the operation
  // },
  // child: Text('Add Book'),
  // ),

  void _addBook ()  async {
    if (_formKey.currentState!.validate()) {
// Form is valid, perform submission logic here
      String name = _nameController.text;
      int pages = int.parse(_pagesController.text);
      print("The name is$name, and my email is $pages");

   final newBook = Book(title: name, pages: pages);
   await bookController.insertBook(newBook);// Use GetX controller for the operation



      _pagesController.clear();
      _nameController.clear();


// Show a snackbar for successful completion
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Form submitted successfully')),
      );
    }



    Get.toNamed("/");


  }


  @override
  Widget build(BuildContext context) {
    return  Form(
      key: _formKey,
      child: Column(
        children: [


          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(labelText: 'Book Title'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the Title of your Book';
              }
              return null;
            },
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            controller: _pagesController,
            decoration: InputDecoration(labelText: 'Pages'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the number of pages of your book';
              }

              return null;
            },
          ),
          ElevatedButton(
            onPressed: _addBook,
            child: Text('Add book'),
          ),

        ],
      ),
    );
  }
}
