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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateTodoPage()),
          );
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
          itemCount: dummyTodoData.length,
          itemBuilder: (context, index) {
            Todo data = dummyTodoData[index];
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
