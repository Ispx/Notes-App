import 'package:flutter/material.dart';
import 'package:notes_app/core/theme_app.dart';
import 'package:notes_app/pages/create_note.dart';
import 'package:notes_app/pages/home_page.dart';

class MyApp extends StatelessWidget {
  final String title = 'Notes App';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      theme: themeApp(),
      initialRoute: '/home/',
      routes: {
        '/home/': (context) => HomePage(title),
        '/create-note/': (context) => CreateNote(),
      },
    );
  }
}
