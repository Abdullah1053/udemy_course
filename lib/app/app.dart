import 'package:flutter/material.dart';
import'package:udemy_course/presentaion/resources/theme_manager.dart';
import'package:udemy_course/presentaion/resources/routes_manager.dart';
//import 'package:udemy_course/presentaion/splash/splash_view.dart';

class MyApp extends StatefulWidget{

 // const MyApp({Key?,key}) : super(key:key);//defualt construct

MyApp._internal(); // named constructor

//int _appState = 0; 

static final MyApp _instance = MyApp._internal();   // single instance 

factory MyApp() => _instance; //factory of instance 

@override 
  
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{

  @override 

  Widget build(BuildContext context){

    return MaterialApp(
     onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getApplicationTheme(),
      );
      
  }
}