import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit_app/cubits/todo_list/todo_list_state.dart';
import 'package:todo_cubit_app/models/todo_model.dart';

class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit() : super(TodoListState.initial());

  void addTodo(String todoDesc) {
    final newTodo = Todo(desc: todoDesc);
    final newTodos = [...state.todos, newTodo];

    emit(state.copyWith(todos: newTodos));
    print(state);
  }

  void editTodo(String id, String todoDesc) {
    final newTodos = state.todos.map((Todo todo) {
      if (todo.id == id) {
        return Todo(
          id: id,
          desc: todoDesc,
          completed: todo.completed,
        );
      }
      return todo;
    }).toList();

    emit(state.copyWith(todos: newTodos));
  }

  void toggleTodo(String id) {
    final newTodos = state.todos.map((Todo todo) {
      if (todo.id == id) {
        return Todo(
          id: id,
          desc: todo.desc,
          completed: !todo.completed,
        );
      }
      return todo;
    }).toList();

    emit(state.copyWith(todos: newTodos));
  }

  void remoteTodo(Todo todo) {
    final newTodos = state.todos.where((Todo t) => t.id != todo.id).toList();

    emit(state.copyWith(todos: newTodos));
  }
}
