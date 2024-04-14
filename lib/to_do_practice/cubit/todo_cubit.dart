import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_practice/to_do_practice/model/todo_model.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);

  void addTodo(String name) {
    final todo = Todo(
      name: name,
      createdAt: DateTime.now(),
    );

    emit([...state, todo]);
  }
}
