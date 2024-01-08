import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootcamp_todo_app/data/repo/todosdao_repository.dart';

class RecordPageCubit extends Cubit<void> {
  RecordPageCubit():super(0);

  var todoRepo = ToDosDaoRepository();

  Future<void> record(String text) async {
    await todoRepo.record(text);
  }
}