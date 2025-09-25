import 'package:tz_kpi/data/datasources/remote_data_source.dart';
import 'package:tz_kpi/domain/models/task.dart';
import 'package:tz_kpi/domain/repository/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final RemoteDataSource _remote = RemoteDataSource();

  @override
  Future<List<Task>> loadTasks({
    required String periodStart,
    required String periodEnd,
    required String periodKey,
    required String requestedId,
    required String behaviourKey,
    required String withResult,
    required String responseFields,
    required String authId,
  }) async {
    final response = await _remote.loadTasks(
      periodStart,
      periodEnd,
      periodKey,
      requestedId,
      behaviourKey,
      withResult,
      responseFields,
      authId,
    );

    final List<Task> tasks = [];

    for (final el in response) {
      Task task = el.toModel();
      tasks.add(task);
    }

    return tasks;
  }

  // @override
  // Future<void> updateTask({
  //   required String periodStart,
  //   required String periodEnd,
  //   required String periodKey,
  //   required String indicatorId,
  //   required String fieldName,
  //   required String fieldValue,
  //   required String authId,
  // }) async {}
}
