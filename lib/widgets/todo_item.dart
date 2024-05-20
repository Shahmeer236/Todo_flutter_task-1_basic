import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_1/model/todo.dart';

class TodoItem extends StatelessWidget {
  final ToDo todo;
  final onTodoChanged;
  final onDeleteItem;

  const TodoItem(
      {Key? key,
      required this.todo,
      required this.onTodoChanged,
      required this.onDeleteItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        margin: const EdgeInsets.symmetric(
            vertical: 8.0), // Optional: add some spacing around the tile
        child: ListTile(
          onTap: () => onTodoChanged(todo),
          leading: Checkbox(
            value: todo.isDone ?? true ? true : false,
            onChanged: (bool? value) {},
          ),
          title: Text(todo.todoText!,
              style: TextStyle(
                  decoration:
                      todo.isDone ?? true ? TextDecoration.lineThrough : null)),
          trailing: Container(
            height: 48,
            width: 48,
            color: Color.fromARGB(154, 208, 2, 2),
            child: IconButton(
              icon: const Icon(Icons.delete),
              color: Colors.white,
              onPressed: () => onDeleteItem(todo.id!),
            ),
          ),
        ));
  }
}
