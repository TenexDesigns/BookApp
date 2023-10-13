import 'dart:async';
import 'package:cars2/screens/AddBookScreen.dart';
import 'package:cars2/screens/EditForm.dart';
import 'package:cars2/screens/ListScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'components/BookList.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Book App',
      initialRoute: '/', // Set the initial route
      getPages: [
        GetPage(name: '/', page: () => ListScreen()), // Home Screen
        GetPage(name: '/add-book', page: () => AddBookScreen() ), // Details Screen
        GetPage(name: '/edit-book', page: () => EditForm()), // Details Screen
      ],
    );
  }
}


// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('SQLite Example')),
//         body: BookList(),
//       ),
//     );
//   }
// }
//
// class BookList extends StatefulWidget {
//   @override
//   _BookListState createState() => _BookListState();
// }
//
// class _BookListState extends State<BookList> {
//   final dbHelper = DatabaseHelper();
//   final List<Book> books = [];
//
//   @override
//   void initState() {
//     super.initState();
//     dbHelper.open();
//     _refreshBookList();
//   }
//
//   Future<void> _refreshBookList() async {
//     final list = await dbHelper.getBooks();
//     setState(() {
//       books.clear();
//       books.addAll(list);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//
//       color:Colors.deepOrange,
//       child: Column(
//         children: [
//           ElevatedButton(
//             onPressed: () async {
//               final newBook = Book(title: 'Flutter Book', pages: 300,id: 1);
//               await dbHelper.insertBook(newBook);
//               _refreshBookList();
//             },
//             child: Text('Add Book'),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: books.length,
//               itemBuilder: (context, index) {
//                 final book = books[index];
//                 return ListTile(
//                   title: Text(book.title),
//                   subtitle: Text('Pages: ${book.pages}'),
//                   trailing: IconButton(
//                     icon: Icon(Icons.delete),
//                     onPressed: () async {
//                       await dbHelper.deleteBook(book.id!);
//                       _refreshBookList();
//                     },
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


// void main() {
//   runApp(MyApp());
//   Boook boook = Boook();
//
//   print(boook.name);
//   print(boook.namr.value);
//
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'My App',
//       initialRoute: '/', // Set the initial route
//       getPages: [
//         GetPage(name: '/', page: () => HomeScreen()), // Home Screen
//         GetPage(name: '/details', page: () => DetailsScreen()), // Details Screen
//         GetPage(name: '/count', page: () => CountScreen()), // Details Screen
//         GetPage(name: '/data', page: () => Data()), // Details Screen
//         // Add more routes as needed
//       ],
//     );
//   }
// }


















//--------------------------------------------------------------------
// class MyApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//
//     return GetMaterialApp(
//
//         getPages: [
//           GetPage(name: '/home', page: () => HomeScreen()),
//           GetPage(name: '/details', page: () => DetailsScreen()),
//           // Add more named routes as needed
//         ],
//       title: "Snack bar",
//       home:Scaffold(
//         appBar: AppBar(title: Text("Snackbar"),),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   Get.toNamed('/details');
//                 },
//                 child: Text('Go to Details'),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   Get.toNamed('/home');
//                 },
//                 child: Text('Go Home'),
//               )
//
//             ],
//           )
//         )
//       )
//
//
//     );
//   }
//
//
// }





//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('My App'),
//         ),
//         body: Center(
//           child: TextButton(
//             onPressed: () {
//               showDialog(
//                 context: context,
//                 builder: (context) => AlertDialog(
//                   title: Text('My Dialog Box'),
//                   content: Text('This is the content of my dialog box.'),
//                   actions: [
//                     TextButton(
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       },
//                       child: Text('OK'),
//                     ),
//                   ],
//                 ),
//               );
//             },
//             child: Text('Show Dialog Box'),
//           ),
//         ),
//       ),
//     );
//   }
// }


// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: Material(
//             child: Column(
//                 children:[
//                   Text("Hello george Gacau"),
//                   Kim(),
//
//
//                 ]
//             )));
//   }
// }
//
//
// class MyApp2 extends StatelessWidget {
//
//   MyApp2({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: Material(
//             child: Column(
//                 children:[
//                   Text("Hello george Gacau"),
//                   Kim(),
//                   OutlinedButton(
//                     onPressed: (){
//
//                     },
//                     child: Text("Click me"),
//                   )
//
//                 ]
//             )));
//   }
// }
//
// //!AboutDialog
//
// class Widget001 extends StatefulWidget {
//   const Widget001({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<Widget001> createState() => _Widget001State();
// }
//
// class _Widget001State extends State<Widget001> {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: ElevatedButton(
//         child: const Text('Show Abg'),
//         onPressed: () {
//           showDialog(
//             context: context,
//             builder: (context) => const AboutDialog(
//               applicationIcon: FlutterLogo(),
//               applicationLegalese: 'Legalese',
//               applicationName: 'Flutter App',
//               applicationVersion: 'version 1.0.0',
//               children: [
//                 Text('This is a text created by Flutter Mapp'),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
// //
// // class GirlImage extends StatelessWidget{
// //   @override
// //   Widget build(BuildContext context) {
// //     // TODO: implement build
// //     var image = Image.asset('assets/girl.png');
// //
// //
// //
// //     return Container(
// //       child: image,
// //
// //     );
// //   }
// //
// // }
//
// List<String> getListElements() {
//   var items = List<String>.generate(1000, (counter) => "Item $counter");
//   return items;
// }
//
// Widget getListView() {
//   var listItems = getListElements();
//
//   var listView = ListView.builder(itemBuilder: (context, index) {
//     return ListTile(
//       leading: Icon(Icons.arrow_right),
//       title: Text(listItems[index]),
//       onTap: () {
//         debugPrint('${listItems[index]} was tapped');
//       },
//     );
//   });
//
//   return listView;
// }
//
// class Icon11 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//
//     return Container(
//         child: IconButton(
//       icon: FaIcon(FontAwesomeIcons.addressBook),
//       onPressed: () {
//         // Perform an action when the button is pressed
//         print("Georggege");
//       },
//     ));
//   }
// }
//
// class FavoriteCity extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _FavoriteCity();
//   }
// }
//
// class _FavoriteCity extends State<FavoriteCity> {
//   Future<String> book = Future.delayed(Duration(seconds: 6), () {
//     return "My secrete file content";
//   });
//
//   String name = "";
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TextField(
//           onSubmitted: (String string) {
//             setState(() {
//               name = string;
//             });
//           },
//         ),
//         Text("Your favourite city is $name ")
//       ],
//     );
//   }
// }
