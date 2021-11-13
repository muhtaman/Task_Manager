// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// This widget is used to create the edit/create task page

import 'package:flutter/material.dart';

class TaskFormWidget extends StatelessWidget {
  final int? number;
  final String? title;
  final String? description;

  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;

  const TaskFormWidget({
    Key? key,
    this.number = 0,
    this.title = '',
    this.description = '',
    required this.onChangedTitle,
    required this.onChangedDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 5),
              buildTitle(),
              SizedBox(height: 25),
              buildDescription(),
            ],
          ),
        ),
      );

  //Designs title text field
  Widget buildTitle() => TextFormField(
        maxLines: 1,
        initialValue: title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
        decoration: InputDecoration(
          hintText: 'What needs to be done?',
          hintStyle: TextStyle(color: Colors.white30),
        ),
        validator: (title) =>
            title != null && title.isEmpty ? 'The title cannot be empty' : null,
        onChanged: onChangedTitle,
      );

  //Designs description text field
  Widget buildDescription() => TextFormField(
        maxLines: 18,
        initialValue: description,
        style: TextStyle(color: Colors.white, fontSize: 18),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Write description here',
          hintStyle: TextStyle(color: Colors.white60),
        ),
        onChanged: onChangedDescription,
      );
}
