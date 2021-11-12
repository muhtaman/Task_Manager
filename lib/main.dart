// ignore_for_file: prefer_const_declarations, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todolist_flutter/page/task_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Task Manager';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          primaryColor: Colors.blue.shade800,
          scaffoldBackgroundColor: Colors.blueAccent.shade100,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.indigo,
            elevation: 0,
          ),
        ),
        home: TaskPage(),
      );
}
