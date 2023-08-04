
import 'package:bloc/bloc.dart';
import 'package:todo_cubit_app/cubits/filtered_todos/filtered_todos_state.dart';

import 'package:todo_cubit_app/models/todo_model.dart';

class FilteredTodosCubit extends Cubit<FilteredTodosState> {
  final List<Todo> initialTodos;

  FilteredTodosCubit({
    required this.initialTodos,
  }) : super(FilteredTodosState(filteredTodos: initialTodos));

  void setFilteredTodos(Filter filter, List<Todo> todos, String searchTerm) {
    List<Todo> _filteredTodos;

    switch (filter) {
      case Filter.active:
        _filteredTodos = todos
            .where((Todo todo) => !todo.completed)
            .toList();
        break;
      case Filter.completed:
        _filteredTodos = todos
            .where((Todo todo) => todo.completed)
            .toList();
        break;
      case Filter.all:
      default:
        _filteredTodos = todos;
        break;
    }

    if (searchTerm.isNotEmpty) {
      _filteredTodos = _filteredTodos
          .where((Todo todo) => todo.desc
              .toLowerCase()
              .contains(searchTerm))
          .toList();
    }

    emit(state.copyWith(filteredTodos: _filteredTodos));
  }
}
