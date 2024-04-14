import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_practice/to_do_practice/cubit/todo_cubit.dart';
import 'package:state_management_practice/to_do_practice/model/todo_model.dart';
import 'package:state_management_practice/to_do_practice/screens/add_todo_screen.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TodoCubit, List<Todo>>(
        builder: (context, todos) {
          return todos.isNotEmpty
              ? ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    final todo = todos[index];
                    return Text(todo.name);
                  },
                )
              : const Center(
                  child: Text('empty list'),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_forward_ios),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddTodoScreen(),
              ));
        },
      ),
    );
  }
}
