import 'package:flutter/material.dart';
import 'package:todo/features/home/model/todo.dart';

class EditTodoPage extends StatelessWidget {
  const EditTodoPage({ required this.todo});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Text(todo.title),
      ),
    );
  }
}
