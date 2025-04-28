import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter_bloc/bloc/todo_bloc/todo_bloc.dart';
import 'package:learn_flutter_bloc/bloc/todo_bloc/todo_event.dart';
import 'package:learn_flutter_bloc/bloc/todo_bloc/todo_state.dart';

class TodoScreen extends StatefulWidget {
  int i = 1;
  TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Todo App")),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state.todoList.isEmpty) {
            return const Center(
              child: Text("No Todo Found"),
            );
          } else if (state.todoList.isNotEmpty) {
            return ListView.builder(
              itemCount: state.todoList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.todoList[index].toString()),
                  trailing: InkWell(onTap: () {
                    context.read<TodoBloc>().add(RemoveTodoEvent(number: index));
                    // Reset i if the list is empty
                    if (state.todoList.length == 1) {
                      widget.i = 1;
                    }
                  }, child: const Icon(Icons.delete)),
                );
              },
            );
          } else {
            return const SizedBox();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          context.read<TodoBloc>().add(AddTodoEvent(number: widget.i++));
        },
      ),
    );
  }
}
