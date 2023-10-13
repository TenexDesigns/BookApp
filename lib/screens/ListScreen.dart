


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/BookList.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List Of Books"),),
      body: BookList() ,
    );
  }
}
