import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit_app/blocs/todo_filter/todo_filter_event.dart';
import 'package:todo_cubit_app/blocs/todo_filter/todo_filter_state.dart';

class TodoFilterBloc extends Bloc<TodoFilterEvent, TodoFilterState> {
  TodoFilterBloc() : super(TodoFilterState.initial()) {
    on<ChangeFilterEvent>((event, emit) {
      emit(state.copyWith(filter: event.newFilter));
    });
  }
}
