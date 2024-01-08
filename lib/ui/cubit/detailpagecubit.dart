import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootcamp_todo_app/data/repo/todosdao_repository.dart';

class DetailPageCubit extends Cubit<void> {
  DetailPageCubit():super(0);

  var todoRepo = ToDosDaoRepository();

  Future<void> update(int id, String text) async {
    await todoRepo.update(id, text);
  }
}