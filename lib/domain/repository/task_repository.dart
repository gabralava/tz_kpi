import 'package:tz_kpi/domain/models/task.dart';

abstract class TaskRepository {
  Future<List<Task>> loadTasks({
    required String periodStart,
    required String periodEnd,
    required String periodKey,
    required String requestedId,
    required String behaviourKey,
    required String withResult,
    required String responseFields,
    required String authId,
  });

  // Future<List<Task>> updateTask(
  //   String periodStart,
  //   String periodEnd,
  //   String periodKey,
  //   String indicatorId,
  //   String fieldName,
  //   String fieldValue,
  //   String authId,
  // );
}
