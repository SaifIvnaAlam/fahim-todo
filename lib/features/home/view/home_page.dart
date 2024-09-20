import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo/features/create_todo/view/create_todo_page.dart';
import 'package:todo/features/edit_todo/view/edit_todo_page.dart';
import 'package:todo/features/home/model/todo.dart';
import 'package:todo/features/home/controller/todo_dummy_data.dart';
//We need a way to navigate to create new todo

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  late List<Todo> todos;
  @override
  void initState() {
    todos = dummyTodoData;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Todo? todo = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateTodoPage()),
          );

          if (todo != null) {
            setState(() {
              todos.add(todo);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text(
          'TODO APPLICATION',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            Todo data = todos[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditTodoPage(
                      todo: data,
                    ),
                  ),
                );
              },
              child: Card(
                color: Colors.purple.shade100,
                child: ListTile(
                  title: Text(data.title),
                  subtitle: Text(data.description),
                  leading: Checkbox(
                    value: data.isDone,
                    onChanged: (a) {
                      setState(() {
                        data.isDone = !data.isDone;
                      });
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
