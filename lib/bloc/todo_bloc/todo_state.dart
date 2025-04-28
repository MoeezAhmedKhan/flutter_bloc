class TodoState{
  final List<int> todoList;
  TodoState({this.todoList = const []});

  TodoState copyWith({List<int>? todoList}){
    return TodoState(todoList: todoList ??  this.todoList);
  }
}