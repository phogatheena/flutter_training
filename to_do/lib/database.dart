import 'package:hive_flutter/hive_flutter.dart';
class ToDoDatabase {
  List toDoList = [];

  final _myBox = Hive.box('mybox');

  // Create default data if app runs first time
  void createInitialData() {
    toDoList = [
      ['Make Tutorial', false],
      ['Do Exercise', false]
    ];
    updateDatabase(); // Save to Hive
  }

  // Load data from Hive
  void loadData() {
    toDoList = _myBox.get('TODOLIST') ?? [];
  }

  // Update Hive with current list
  void updateDatabase() {
    _myBox.put('TODOLIST', toDoList);
  }
}
