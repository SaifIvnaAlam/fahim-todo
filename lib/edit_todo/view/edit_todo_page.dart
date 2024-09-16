import 'package:flutter/material.dart';
import 'package:todo/home/model/todo.dart';

class EditTodoPage extends StatelessWidget {
  const EditTodoPage({super.key, required this.todo});

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
