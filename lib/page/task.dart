// ignore_for_file: prefer_const_declarations

//Contains all the information a Task should have
//Used for task widgets

final String tableTasks = 'tasks';

class TaskFields {
  //used to generate column names for sql database
  static final List<String> values = [id, isComplete, title, description, time];

  //string format so sql can read it
  static final String id = '_id';
  static final String isComplete = 'isImportant';
  static final String title = 'title';
  static final String description = 'description';
  static final String time = 'time';
}

class Task {
  final int id; //Identifier for tasks
  final bool isComplete; //Has task been completed?
  final String title; //Title of Task
  final String description; //Description of Task
  final DateTime createdTime; //Time of task creation

  const Task({
    required this.id,
    required this.isComplete,
    required this.title,
    required this.description,
    required this.createdTime,
  });

  // Used to overrite existing tasks in editting
  Task copy({
    int? id,
    bool? isComplete,
    String? title,
    String? description,
    DateTime? createdTime,
  }) =>
      Task(
        id: id ?? this.id,
        isComplete: isComplete ?? this.isComplete,
        title: title ?? this.title,
        description: description ?? this.description,
        createdTime: createdTime ?? this.createdTime,
      );

  //translating json to task data from sql database
  static Task fromJson(Map<String, Object?> json) => Task(
        id: json[TaskFields.id] as int,
        isComplete: json[TaskFields.isComplete] == 1,
        title: json[TaskFields.title] as String,
        description: json[TaskFields.description] as String,
        createdTime: DateTime.parse(json[TaskFields.time] as String),
      );

  //translating task data to json for sql database
  Map<String, Object?> toJson() => {
        TaskFields.id: id,
        TaskFields.title: title,
        TaskFields.isComplete: isComplete ? 1 : 0,
        TaskFields.description: description,
        TaskFields.time: createdTime.toIso8601String(),
      };
}
