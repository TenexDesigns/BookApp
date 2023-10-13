import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/BookController.dart';
import '../model/Book.dart';




class EditForm extends StatefulWidget {



  late Book book;

  EditForm.name(Book book1){
    book = book1;

  }






  @override
  State<EditForm> createState() => _EditFormState(book);
}

class _EditFormState extends State<EditForm> {

  late Book book;

  _EditFormState(Book book1){
    book = book1;

  }

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


  void _editBook ()  async {
    if (_formKey.currentState!.validate()) {
// Form is valid, perform submission logic here
      String name = _nameController.text;
      int pages = int.parse(_pagesController.text);
      print("The name is$name, and my email is $pages");

      final newBook = Book(title: name, pages: pages);
      // await bookController.updateBook(newBook);  // Use GetX controller for the operation



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
              if (value != null) {
                if(value.length <0 ){
                  return "Please enter a valid name";


                }
              }
              return null;
            },
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            controller: _pagesController,
            decoration: InputDecoration(labelText: 'Pages'),
            validator: (value) {

              if (value != null) {
                if(int.parse(value) < 0 || int.parse(value) >1000){
                  return "Please enter a pages between 1 - 1000";


                }
              }

              return null;
            },
          ),
          ElevatedButton(
            onPressed: _editBook,
            child: Text('Edit book'),
          ),

        ],
      ),
    );;
  }
}




