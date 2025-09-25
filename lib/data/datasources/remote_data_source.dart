import 'package:dio/dio.dart';
import 'package:tz_kpi/data/datasources/http_client.dart';
import 'package:tz_kpi/data/dto/task_dto.dart';

class RemoteDataSource {
  final HttpClient _client = HttpClient('5c3964b8e3ee4755f2cc0febb851e2f8');

  Future<List<TaskDto>> loadTasks(
    String periodStart,
    String periodEnd,
    String periodKey,
    String requestedId,
    String behaviourKey,
    String withResult,
    String responseFields,
    String authId,
  ) async {
    final formData = FormData.fromMap({
      "period_start": periodStart,
      "period_end": periodEnd,
      "period_key": periodKey,
      "requested_mo_id": requestedId,
      "behaviour_key": behaviourKey,
      "with_result": withResult,
      "response_fields": responseFields,
      "auth_user_id": authId,
    });

    final response = await _client.request(
      url: 'https://api.dev.kpi-drive.ru/_api/indicators/get_mo_indicators',
      data: formData,
      method: 'POST',
    );

    final rows = response['DATA']['rows'];
    final List<TaskDto> tasks = [];

    for (final el in rows) {
      final TaskDto task = TaskDto.fromJson(el);
      tasks.add(task);
    }

    return tasks;
  }
}
