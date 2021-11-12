// ignore_for_file: prefer_const_constructors, unnecessary_this, use_key_in_widget_constructors

/*
This is the main page that hosts all tasks and widgets.
*/

import 'package:flutter/material.dart';
import 'package:todolist_flutter/db/task_db.dart';
import 'package:todolist_flutter/page/task.dart';
import 'package:todolist_flutter/page/edit_tasks_page.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todolist_flutter/widgets/task_widget.dart';

class TaskPage extends StatefulWidget {
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  late List<Task> tasks;
  bool isLoading = false;

  //Runs on page creation and loads tasks from database
  //onto screen.
  @override
  void initState() {
    super.initState();

    refreshTasks();
  }

  @override
  void dispose() {
    TasksDatabase.instance.close();

    super.dispose();
  }

  //Provides tasks from database when called
  Future refreshTasks() async {
    setState(() => isLoading = true);
    this.tasks = await TasksDatabase.instance.readAll();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Task Manager',
            style: TextStyle(fontSize: 24),
          ),
        ),
        body: Center(
          child: isLoading
              ? CircularProgressIndicator()
              : tasks.isEmpty
                  ? Text(
                      'No Tasks',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    )
                  : buildTasks(),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue.shade900,
          child: Icon(Icons.add),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(23),
          ),
          onPressed: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => EditTasksPage()),
            );

            refreshTasks();
          },
        ),
      );

  //Displays list of task widgets
  Widget buildTasks() {
    return tasks.isEmpty
        ? Center(
            child: Text(
              'No tasks.',
              style: TextStyle(fontSize: 20),
            ),
          )
        : ListView.separated(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(16),
            separatorBuilder: (context, index) => Container(height: 6),
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final taskListItem = tasks[index];
              return Row(children: [
                Checkbox(
                  activeColor: Theme.of(context).primaryColor,
                  checkColor: Colors.white,
                  value: taskListItem.isComplete,
                  onChanged: (_) async {
                    final task = taskListItem.copy(
                      isComplete: !taskListItem.isComplete,
                    );

                    await TasksDatabase.instance.update(task);
                    refreshTasks();

                    Helper.showSnackBar(
                      context,
                      !taskListItem.isComplete
                          ? 'Task completed'
                          : 'Task marked incomplete',
                    );
                  },
                ),
                Slidable(
                  actionPane: const SlidableDrawerActionPane(),
                  child: GestureDetector(
                    onTap: () async {
                      await showDialog(
                        context: context,
                        builder: (context) => EditTasksPage(task: taskListItem),
                        barrierDismissible: false,
                      );
                      refreshTasks();
                    },
                    child: TaskWidget(task: taskListItem, index: index),
                  ),
                  secondaryActions: [
                    IconSlideAction(
                      color: Colors.red,
                      caption: 'Delete',
                      onTap: () async {
                        await TasksDatabase.instance.delete(taskListItem.id);
                        refreshTasks();
                      },
                      icon: Icons.delete,
                    )
                  ],
                ),
              ]);
            });
  }
}

// Displays a message whenever task is completed or
// marked incomplete
class Helper {
  static void showSnackBar(BuildContext context, String text) {
    SnackBar resultText = SnackBar(
      content: Text(text),
      duration: const Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(resultText);
  }
}
