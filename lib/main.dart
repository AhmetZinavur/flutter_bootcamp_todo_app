import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootcamp_todo_app/ui/cubit/detailpagecubit.dart';
import 'package:flutter_bootcamp_todo_app/ui/cubit/homepagecubit.dart';
import 'package:flutter_bootcamp_todo_app/ui/cubit/recordpagecubit.dart';
import 'package:flutter_bootcamp_todo_app/ui/views/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RecordPageCubit()),
        BlocProvider(create: (context) => DetailPageCubit()),
        BlocProvider(create: (context) => HomePageCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}