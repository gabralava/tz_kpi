import 'package:tz_kpi/domain/models/task.dart';

class TaskDto implements Task {
  @override
  final String name;

  @override
  final int indicatorId;

  @override
  final int parentId;

  @override
  final int order;

  TaskDto({
    required this.name,
    required this.indicatorId,
    required this.parentId,
    required this.order,
  });

  factory TaskDto.fromJson(Map<String, dynamic> json) => TaskDto(
    name: json["name"],
    indicatorId: json["indicator_to_mo_id"],
    parentId: json["parent_id"],
    order: json["order"],
  );

  Map<String, dynamic> toJson(TaskDto instance) => {
    "name": instance.name,
    "indicator_to_mo_id": instance.indicatorId,
    "parent_id": instance.parentId,
    "order": instance.order,
  };

  Task toModel() => Task(
    name: name,
    indicatorId: indicatorId,
    parentId: parentId,
    order: order,
  );
}
