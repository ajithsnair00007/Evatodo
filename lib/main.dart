import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/provider/todo_provider.dart';
import 'package:todo_list_app/screen/add_update.dart';
import 'package:todo_list_app/screen/home_screen.dart';
void main() {
  runApp(const MyApp());
  
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>NotesProviders(),
      child:  MaterialApp(
        initialRoute: '/homescreen',
        routes: {
          '/homescreen':(context) =>  HomeScreen(),
          '/add_edit':(context) =>  DialogWidget(isupdate: false,),
        },
        debugShowCheckedModeBanner: false,
        home:  HomeScreen(),
        
      ),
    );
  }
}