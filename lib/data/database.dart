import 'package:hive/hive.dart';

import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];

  //reference the box
  final _mybox = Hive.box('mybox');

  //this will run only the 1st time ever opening th app
  void createInitialData() {
    toDoList = [
      //list of tasks
      ["Complete STL", false],
      ["Complete DSA", false],
    ];
  }

  //load data from database
  void loadData() {
    toDoList = _mybox.get("TODOLIST");
  }

  //update the databasee
  void updateDataBase() {
    _mybox.put("TODOLIST", toDoList);
  }
}
