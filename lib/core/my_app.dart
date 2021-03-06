import 'package:flutter/material.dart';
import 'package:notes_app/core/theme_app.dart';
import 'package:notes_app/models/auth_model.dart';
import 'package:notes_app/pages/create_note.dart';
import 'package:notes_app/pages/home_page.dart';
import 'package:notes_app/pages/login_page.dart';

class MyApp extends StatelessWidget {
  final String title = 'Notes App';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      theme: themeApp(),
      initialRoute: '/',
      onGenerateRoute: (arg) {
        if (arg.name == '/home/') {
          AuthModel authModel = arg.arguments as AuthModel;
          return MaterialPageRoute(builder: (context) => HomePage(authModel));
        }
      },
      routes: {
        '/': (context) => LoginPage(),
        '/create-note/': (context) => CreateNote(),
      },
    );
  }
}
