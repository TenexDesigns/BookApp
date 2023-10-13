import 'package:cars2/components/EditForm.dart';
import 'package:cars2/model/Book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../components/Form.dart';
import '../controllers/BookController.dart';

// class EditBookScreen extends StatefulWidget {
//
//
//   @override
//   State<EditBookScreen> createState() => _EditBookScreenState();
// }
//
// class _EditBookScreenState extends State<EditBookScreen> {
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     final arguments = Get.arguments;
//
//     // TODO: implement build
//       if (1 > 2){
//         return Text("George");
//       }
//   }
//
//
//
//
// }

//
// class King extends StatelessWidget {
//   const King({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
//
//
// }
//
//
// class EditForm extends StatefulWidget {
//   @override
//   State<EditForm> createState() => _EditFormState();
// }
//
// class _EditFormState extends State<EditForm> {
//   final BookController bookController = Get.put(BookController());
//
//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   final _pagesController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Retrieve the book object passed as an argument
//     final Book book = Get.arguments;
//
//     // Set the initial values in the text fields
//     _nameController.text = book.title;
//     _pagesController.text = book.pages.toString();
//   }
//
//   void _editBook() {
//     if (_formKey.currentState!.validate()) {
//       String name = _nameController.text;
//       int pages = int.parse(_pagesController.text);
//
//       // Create an updated book object
//       final updatedBook = Book(
//         id: Get.arguments.id, // Preserve the book's ID
//         title: name,
//         pages: pages,
//       );
//
//       // Update the book using the BookController
//       bookController.updateBook(updatedBook);
//
//       // Show a snackbar for successful completion
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Book updated successfully')),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         children: [
//           TextFormField(
//             controller: _nameController,
//             decoration: InputDecoration(labelText: 'Book Title'),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter the Title of your Book';
//               }
//               return null;
//             },
//           ),
//           TextFormField(
//             keyboardType: TextInputType.number,
//             controller: _pagesController,
//             decoration: InputDecoration(labelText: 'Pages'),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter the number of pages of your book';
//               }
//               if (int.parse(value) < 1 || int.parse(value) > 1000) {
//                 return 'Please enter pages between 1 - 1000';
//               }
//               return null;
//             },
//           ),
//           ElevatedButton(
//             onPressed: _editBook,
//             child: Text('Edit book'),
//           ),
//         ],
//       ),
//     );
//   }
// }
//


class EditForm extends StatefulWidget {
  @override
  State<EditForm> createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
  final BookController bookController = Get.put(BookController());
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _pagesController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Retrieve the book object passed as an argument
    final Book book = Get.arguments;

    // Set the initial values in the text fields
    _nameController.text = book.title;
    _pagesController.text = book.pages.toString();
  }

  void _editBook() {
    if (_formKey.currentState!.validate()) {
      String name = _nameController.text;
      int pages = int.parse(_pagesController.text);

      // Create an updated book object
      final Map<String,dynamic> updatedBook = {
        "id": Get.arguments.id, // Preserve the book's ID
        "title": name,
        "pages": pages,
      };

      // Update the book using the BookController
      bookController.updateBook(updatedBook);

      _nameController.clear();
      _pagesController.clear();

      // Show a snackbar for successful completion
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Book updated successfully')),
      );

      Get.toNamed("/");
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Page"),),
      body:Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(labelText: 'Book Title'),
            validator: (value) {

              return null;
            },
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            controller: _pagesController,
            decoration: InputDecoration(labelText: 'Pages'),
            validator: (value) {
              if (value != null ) {

                  if (int.parse(value) < 1 || int.parse(value) > 1000) {
                    return 'Please enter pages between 1 - 1000';
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
    )
    );
  }
}

