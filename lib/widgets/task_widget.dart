// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

//This widget is used to display a task on the tasks page
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todolist_flutter/page/task.dart';

class TaskWidget extends StatelessWidget {
  TaskWidget({
    Key? key,
    required this.task,
    required this.index,
  }) : super(key: key);

  final Task task;
  final int index;

  @override
  Widget build(BuildContext context) {
    /// Pick random colors to add more color for todo list
    final colors = randomColor[index % randomColor.length];

    // Provides the time and date of creation for note
    final time = DateFormat.yMMMd().format(task.createdTime) +
        " " +
        DateFormat.jms().format(task.createdTime);

    return Card(
      color: colors,
      child: Container(
        constraints: BoxConstraints(
          minHeight: 100,
          maxHeight: 200,
          minWidth: MediaQuery.of(context).size.width / 1.4,
          maxWidth: MediaQuery.of(context).size.width / 1.4,
        ),
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              time,
              style: TextStyle(color: Colors.grey.shade700),
            ),
            SizedBox(height: 10),
            Flexible(
              child: Text(task.title,
                  //maxLines: 3,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            if (task.description.isNotEmpty)
              Container(
                margin: const EdgeInsets.only(top: 5),
                child: Text(
                  task.description,
                  style: const TextStyle(fontSize: 16, height: 1.5),
                  maxLines: 3,
                  strutStyle: StrutStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    height: 1,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}

//Array of light colors for tasks
final randomColor = [
  Colors.pink.shade100,
  Colors.amber.shade300,
  Colors.purple.shade200,
  Colors.orange.shade300,
  Colors.teal.shade100,
  Colors.green.shade200
];
