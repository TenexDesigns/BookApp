import 'package:cars2/model/Book.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/BookController.dart';
import '../screens/EditForm.dart';
import '../services/BookService.dart'; // Import the 'get' package



class BookList extends StatelessWidget { // Extend GetView instead of StatefulWidget


  final BookController bookController = Get.put(BookController());




    // Initialize state here.

  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: (){
              Get.toNamed('/add-book');

            },
            child: Text("Add Book Page")),

        Expanded(
          child:Obx(() => ListView.builder(
                  itemCount: bookController.books.length,
                  itemBuilder: (context, index) {
                    final book = bookController.books[index];
                    return DecoratedBox( decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),

                    ),
                    child:Container(
                      margin: EdgeInsets.symmetric(vertical: 10),

                      child:  ListTile(





                      title: Text(book.title),
                      subtitle: Text('Pages: ${book.pages}'),

                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          IconButton(
                            color: Colors.blueAccent,
                            icon: Icon(Icons.edit_rounded),
                            onPressed: () {
                              Get.toNamed('/edit-book', arguments: book);
                            },

                          ),
                          IconButton(
                            color: Colors.redAccent,
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              bookController.deleteBook(book.id!);
                            },

                          ),


                        ],
                      ),
                      onTap: () {
                        // Navigate to the edit page and pass the selected book as an argument
                        Get.toNamed('/edit-book', arguments: book);
                      },

                    )),);

                  },
                )


          )

        ),
      ],
    );
  }
}



