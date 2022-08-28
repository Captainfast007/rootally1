import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:rootally/PlaceHolder.dart';
late Box box;
late Box box2;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
 box= await Hive.openBox('Operation');
 box2=await Hive.openBox('Operation2');
  DateTime datetime = DateTime.now();
  final DateFormat formatter = DateFormat('dd-MM-yyyy');
  final date = formatter.format(datetime);
 if(box2.get('operation2')!=date) {
   await box.put('operation', 0);
 }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LandingPage(),
    );
  }
}
