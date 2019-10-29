import 'package:flutter/material.dart';
// import 'package:flutter/services.dart'; ------ для полноэкранки
import './todoList.dart';

void main() {
  // SystemChrome.setEnabledSystemUIOverlays([]); --------- полноэкранный режим, но здесь он не имеет смысла... 
  runApp(new TodoApp());
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Todo List',
      home: new TodoList()
    );
  }
}