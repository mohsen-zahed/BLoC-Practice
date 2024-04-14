import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_practice/bloc/counter_bloc.dart';
import 'package:state_management_practice/cubit/counter_cubit.dart';
import 'package:state_management_practice/home_screen.dart';
import 'package:state_management_practice/login_form_practice/bloc/auth_bloc.dart';
import 'package:state_management_practice/to_do_practice/cubit/todo_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (_) => CounterCubit()),
        BlocProvider(create: (_) => TodoCubit()),
        BlocProvider(create: (_) => AuthBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
