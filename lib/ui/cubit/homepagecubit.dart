import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootcamp_todo_app/data/entity/todo.dart';
import 'package:flutter_bootcamp_todo_app/data/repo/todosdao_repository.dart';

class HomePageCubit extends Cubit<List<ToDo>> {
  HomePageCubit():super(<ToDo>[]);

  var todoRepo = ToDosDaoRepository();

  Future<void> read() async {
    var list = await todoRepo.read();
    emit(list);
  }

  Future<void> search(String word) async {
    var list = await todoRepo.search(word);
    emit(list);
  }

  Future<void> delete(int id) async {
    await todoRepo.delete(id);
    await read();
  }
}