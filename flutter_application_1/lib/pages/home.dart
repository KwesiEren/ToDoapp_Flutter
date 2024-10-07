import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/bakend/todo_list.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _contrlr = TextEditingController();
  List todoList = [
    ['Code the Front-End.', false],
    ['Code the Back-End.', false],
  ];

  void chckboxChng(int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  void delTask(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  void savenewTask() {
    setState(() {
      todoList.add([_contrlr.text, false]);
      _contrlr.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade200,
      appBar: AppBar(
        title: const Text(
          'To-Do',
        ),
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        physics: const ScrollPhysics(),
        itemBuilder: (BuildContext context, index) {
          return toDolist(
            taskName: todoList[index][0],
            taskCompleted: todoList[index][1],
            onChanged: (value) => chckboxChng(index),
            deleteFunction: (context) => delTask(index),
          );
        },
      ),
      floatingActionButton: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _contrlr,
                decoration: InputDecoration(
                  hintText: 'Begin Entry Here',
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ),
          FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            hoverColor: Colors.greenAccent,
            onPressed: savenewTask,
          ),
        ],
      ),
    );
  }
}
