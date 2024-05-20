class ToDo {
  String? id;
  String? todoText;
  bool? isDone;

  static List<ToDo> todoList() {
    return [
      // ToDo(
      //   id: "1",
      //   todoText: "Todo 1",
      //   isDone: false,
      // ),
      // ToDo(
      //   id: "2",
      //   todoText: "Todo 2",
      //   isDone: true,
      // ),
      // ToDo(
      //   id: "3",
      //   todoText: "Todo 3",
      //   isDone: false,
      // ),
    ];
  }

  ToDo({
    required this.todoText,
    required this.id,
    this.isDone = false,
  });
}
