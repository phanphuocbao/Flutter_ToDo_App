import 'dart:async';



import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit_app/blocs/active_todo_count/active_todo_count_event.dart';
import 'package:todo_cubit_app/blocs/active_todo_count/active_todo_count_state.dart';
import 'package:todo_cubit_app/blocs/todo_list/todo_list_state.dart';

import '../../models/todo_model.dart';
import '../blocs.dart';


class ActiveTodoCountBloc
    extends Bloc<ActiveTodoCountEvent, ActiveTodoCountState> {
  late final StreamSubscription todoListSubscription;

  final int initialActiveTodoCount;
  final TodoListBloc todoListBloc;
  ActiveTodoCountBloc({
    required this.initialActiveTodoCount,
    required this.todoListBloc,
  }) : super(ActiveTodoCountState(activeTodoCount: initialActiveTodoCount)) {
    todoListSubscription =
        todoListBloc.stream.listen((TodoListState todoListState) {
      print('todoListState: $todoListState');

      final int currentActiveTodoCount = todoListState.todos
          .where((Todo todo) => !todo.completed)
          .toList()
          .length;

      add(CalculateActiveTodoCountEvent(
          activeTodoCount: currentActiveTodoCount));
    });

    on<CalculateActiveTodoCountEvent>((event, emit) {
      emit(state.copyWith(activeTodoCount: event.activeTodoCount));
    });
  }

  @override
  Future<void> close() {
    todoListSubscription.cancel();
    return super.close();
  }
}