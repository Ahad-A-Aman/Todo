// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:recapping_todo/Features/home/controller/todo_dummy_data.dart';

import '../../home/model/todo.dart';

class CreateTodoPage extends StatefulWidget {
  const CreateTodoPage({super.key});

  @override
  State<CreateTodoPage> createState() => _CreateTodoPageState();
}

class _CreateTodoPageState extends State<CreateTodoPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create todo",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent.shade100,
      ),
      body: Column(
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(hintText: "Title"),
          ),
          TextField(
            controller: descriptionController,
            decoration: InputDecoration(hintText: "Description"),
          ),
          Spacer(),
          Container(
            height: 50,
            width: double.infinity,
            color: Colors.deepPurple,
            child: MaterialButton(
              onPressed: () {
                Todo mytodoObject = Todo(
                    isDone: false,
                    title: titleController.text,
                    description: descriptionController.text);

                Navigator.pop(context, mytodoObject);
              },
              child: Text(
                "Save",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
