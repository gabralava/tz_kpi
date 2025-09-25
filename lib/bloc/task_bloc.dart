import 'package:bloc/bloc.dart';
import 'package:tz_kpi/domain/models/task.dart';
import 'package:tz_kpi/domain/repository/task_repository.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc(this._repository) : super(TaskInitial()) {
    on<InitialTaskEvent>(onInitialTask);
  }

  final TaskRepository _repository;

  Future<void> onInitialTask(
    InitialTaskEvent event,
    Emitter<TaskState> emit,
  ) async {
    final tasks = await _repository.loadTasks(
      periodStart: '2025-08-01',
      periodEnd: '2025-08-31',
      periodKey: 'month',
      requestedId: '42',
      behaviourKey: 'task,kpi_task',
      withResult: 'false',
      responseFields: 'name,indicator_to_mo_id,parent_id,order',
      authId: '40',
    );

    emit(state.copyWith(tasks: tasks));
  }
}
