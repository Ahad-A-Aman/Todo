// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:recapping_todo/Features/home/controller/todo_dummy_data.dart';
import 'package:recapping_todo/Features/home/model/todo.dart';
import 'package:recapping_todo/Features/edit_todo/view/edit_todo_page.dart';
import 'package:recapping_todo/Features/create_todo/view/create_todo_page.dart';

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
          final Todo? todo = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateTodoPage()),
          );

          if (todo != null) {
            setState(() {
              todos.add(todo);
            });
          }
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("My Todo List"),
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w700,
          color: Colors.black,
          fontSize: 20,
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: todos.length,
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
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Card(
                  color: Colors.cyan.shade100,
                  child: ListTile(
                    title: Text(data.title),
                    titleTextStyle: TextStyle(fontWeight: FontWeight.bold),
                    subtitle: Text(data.description),
                    leading: Checkbox(
                      value: data.isDone,
                      onChanged: (a) {
                        setState(
                          () {
                            data.isDone = !data.isDone;
                          },
                        );
                      },
                    ),
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
