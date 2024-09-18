import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo/features/home/controller/todo_dummy_data.dart';
import 'package:todo/features/home/model/todo.dart';

class CreateTodoPage extends StatelessWidget {
  const CreateTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create todo',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(hintText: 'Title'),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(hintText: 'Description'),
            ),
            const Spacer(),
            Container(
              height: 50,
              width: double.infinity,
              color: Colors.deepPurple,
              child: MaterialButton(
                onPressed: () {
                  log("save todo pressed");
                  log("UserInput title: ${titleController.text}");
                  log("UserInput Description: ${descriptionController.text}");
                  Todo mytodoObject =
                      Todo(isDone: false, title: titleController.text, description: descriptionController.text);
                  dummyTodoData.add(mytodoObject);
                  Navigator.pop(context);
                },
                child: const Text(
                  "Save Todo",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
