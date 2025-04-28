import 'package:bloc/bloc.dart';
import 'package:learn_flutter_bloc/bloc/todo_bloc/todo_event.dart';
import 'package:learn_flutter_bloc/bloc/todo_bloc/todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState>{

  List<int> todoList = [];
  TodoBloc() : super(TodoState()){
    on<AddTodoEvent>(_addTodo);
    on<RemoveTodoEvent>(_removeTodo);
  }

  void _addTodo(AddTodoEvent event, Emitter<TodoState> emit){
    print("event: ${event.number}");
    todoList.add(event.number);
    emit(state.copyWith(todoList: List.from(todoList)));
  }

  void _removeTodo(RemoveTodoEvent event, Emitter<TodoState> emit){
    todoList.removeAt(event.number);
    emit(state.copyWith(todoList: List.from(todoList)));
  }
}