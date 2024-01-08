import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootcamp_todo_app/data/entity/todo.dart';
import 'package:flutter_bootcamp_todo_app/ui/cubit/detailpagecubit.dart';

class DetailPage extends StatefulWidget {
  
  ToDo todo;

  DetailPage({required this.todo});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  var tfText = TextEditingController();

  @override
  void initState() {
    super.initState();
    var newTodo = widget.todo;

    tfText.text = newTodo.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Güncelle")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tfText, decoration: const InputDecoration(hintText: "Actual To Do"),),
              ElevatedButton(onPressed: () {
                context.read<DetailPageCubit>().update(widget.todo.id, tfText.text);
              }, child: const Text("Güncelle"))
            ],
          ),
        ),
      ),
    );
  }
}