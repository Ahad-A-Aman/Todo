// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:recapping_todo/Features/home/model/todo.dart';

class EditTodoPage extends StatelessWidget {
  const EditTodoPage({super.key, required this.todo});

  final Todo todo; // bujhinai eta

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              todo.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 10),
            Container(
              color: Colors.grey.shade100,
              child: Text(todo.description),
            ),
          ],
        ),
      ),
    );
  }
}
