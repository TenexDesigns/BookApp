import 'package:cars2/components/Form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddBookScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Book"),
        ),
        body: Container(
          child: Column(
            children: [
              MyForm2(),
            ],
          ),
        ));
  }
}
