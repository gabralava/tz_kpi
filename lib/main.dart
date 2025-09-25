import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tz_kpi/bloc/task_bloc.dart';
import 'package:tz_kpi/data/repository/task_repository.dart';
import 'package:tz_kpi/domain/repository/task_repository.dart';
import 'package:tz_kpi/presentation/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<TaskRepository>(create: (_) => TaskRepositoryImpl()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => TaskBloc(TaskRepositoryImpl()))],
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
