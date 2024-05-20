// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:todo_1/model/todo.dart';
import 'package:todo_1/widgets/todo_item.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todoList = ToDo.todoList();
  final _todoController = TextEditingController();
  List<ToDo> _foundToDo = [];

  @override
  void initState() {
    _foundToDo = todoList;
    super.initState();
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Color.fromARGB(146, 188, 229, 177),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.menu),
          SizedBox(width: 80),
          Container(
            width: 80,
            child: Icon(Icons.account_circle),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Stack(children: [
        Container(
          color: const Color.fromARGB(255, 174, 165, 165), // Background color
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            children: [
              searchBox(),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 50, bottom: 20),
                      child: Text(
                        "All todos Here",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    if (todoList.isEmpty)
                      Center(
                        child: Text(
                          "There is nothing to do!!!",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54,
                          ),
                        ),
                      )
                    else
                      for (ToDo todo in _foundToDo.reversed)
                        TodoItem(
                          todo: todo,
                          onTodoChanged: _handleTodoChange,
                          onDeleteItem: _deleteTodoItem,
                        ),

                    // else{}
                    // Ensure the correct class name is used
                    // Add more TodoItems as needed
                  ],
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(children: [
            Expanded(
              child: Container(
                  margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 187, 187),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    controller: _todoController,
                    decoration: InputDecoration(
                      hintText: 'Add a new todo...',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    ),
                  )),
            ),
            Container(
              // Add a container to hold the button
              margin: EdgeInsets.only(bottom: 20, right: 20),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 187, 187),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ElevatedButton(
                child: Text(
                  "+",
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () => {
                  if (_todoController.text.trim().isNotEmpty)
                    {_addTodoItem(_todoController.text)}
                },
              ),
            ),
          ]),
        )
      ]),
    );
  }

  void _handleTodoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone!;
    });
  }

  void _addTodoItem(String todo) {
    setState(() {
      todoList.add(ToDo(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        todoText: todo,
        isDone: false,
      ));
      _todoController.clear();
    });
  } // Add a new todo item to the list (todoList

  void _runFilter(String enteredKeyword) {
    List<ToDo> result = [];
    if (enteredKeyword.isEmpty) {
      result = todoList;
    } else {
      result = todoList
          .where((todo) => todo.todoText!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundToDo = result;
    });
  }

  void _deleteTodoItem(String id) {
    setState(() {
      todoList.removeWhere((todo) => todo.id == id);
    });
  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 187, 187),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (value) {
          _runFilter(value);
        },
        decoration: InputDecoration(
          hintText: 'Search here...',
          prefixIcon: Icon(Icons.search),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
