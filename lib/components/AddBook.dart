import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';





class AddBook extends StatelessWidget{
// In AddBookScreen.dart





  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: // In AddBookScreen.dart
      Form(
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Title'),
              onSaved: (value) {
                // Save the title
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Pages'),
              onSaved: (value) {
                // Save the pages
              },
            ),
            ElevatedButton(
              child: Text('Add Book'),
              onPressed: () {
                // Validate and save the form, then add the book
              },
            ),
          ],
        ),
      )
      ,

    );

  }}