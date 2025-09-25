part of 'task_bloc.dart';

class TaskState {
  final List<Task> tasks;

  const TaskState({required this.tasks});

  TaskState copyWith({List<Task>? tasks}) =>
      TaskState(tasks: tasks ?? this.tasks);
}

final class TaskInitial extends TaskState {
  TaskInitial({super.tasks = const []});
}
