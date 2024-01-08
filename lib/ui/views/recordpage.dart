import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootcamp_todo_app/ui/cubit/recordpagecubit.dart';

class RecordPage extends StatefulWidget {
  const RecordPage({super.key});

  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {

  var tfText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kayıt Ekranı"),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(
            children: [
              TextField(
                controller: tfText,
                decoration: const InputDecoration(hintText: "TO DO"),
              ),
              ElevatedButton(onPressed: () {
                context.read<RecordPageCubit>().record(tfText.text);
              }, child: const Text("Kaydet"))
            ],
          ),
        ),
      ),
    );
  }
}