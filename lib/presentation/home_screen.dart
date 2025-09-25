import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tz_kpi/bloc/task_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    final taskBloc = context.read<TaskBloc>();

    taskBloc.add(InitialTaskEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          final tasks = state.tasks;

          if (tasks.isNotEmpty) {
            return ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return Text(tasks[index].name);
              },
            );
          }

          return Center(child: Text('Данные не получены'));
        },
      ),
    );
  }
}
