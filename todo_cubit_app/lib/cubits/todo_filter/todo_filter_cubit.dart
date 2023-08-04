import 'package:bloc/bloc.dart';
import 'package:todo_cubit_app/cubits/todo_filter/todo_filter_state.dart';
import 'package:todo_cubit_app/models/todo_model.dart';

class TodoFilterCubit extends Cubit<TodoFilterState> {
  TodoFilterCubit() : super(TodoFilterState.initial());

  void changeFilter(Filter newFilter) {
    emit(state.copyWith(filter: newFilter));
  }
}
