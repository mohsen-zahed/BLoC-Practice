import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_practice/to_do_practice/model/todo_model.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);

  //* this is where we can implement all functions that we will use in project

  void addTodo(String name) {
    final todo = Todo(
      name: name,
      createdAt: DateTime.now(),
    );

    //* emit literally means to execute an operation...
    //* ...state means state changes according to the previous state of screen and it occures by creating a new todo list and saving the previous
    //* values into new one and in this way BLoC notices that UI has updated and applies those updates.
    //* on other way that we can implement the below code is like this:
    //* state.add(todo);
    //* emit([...state]);

    emit([...state, todo]);
  }
}
