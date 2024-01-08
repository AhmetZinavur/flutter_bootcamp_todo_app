import 'package:flutter_bootcamp_todo_app/data/entity/todo.dart';
import 'package:flutter_bootcamp_todo_app/sqlite/database_connection.dart';

class ToDosDaoRepository {

  Future<void> record(String text) async {
    var database = await DataBaseConnection.connectDatabase();
    var newTodo = Map<String,dynamic>();
    newTodo["text"]= text;
    await database.insert("todo", newTodo);
  }

  Future<void> update(int id, String text) async {
    var database = await DataBaseConnection.connectDatabase();
    var updateTodo = Map<String,dynamic>();
    updateTodo["text"] = text;
    await database.update("todo", updateTodo, where: "id = ?", whereArgs: [id]);
  }

  Future<void> delete(int id) async {
    var database = await DataBaseConnection.connectDatabase();
    await database.delete("todo",where: "id = ?", whereArgs: [id]);
  }

  Future<List<ToDo>> read() async {
    var database = await DataBaseConnection.connectDatabase();
    List<Map<String,dynamic>> maps = await database.rawQuery("SELECT * FROM todo");

    return List.generate(maps.length, (index) {
      var row = maps[index];
      return ToDo(id: row["id"], text: row["text"]);
    });
  }

  Future<List<ToDo>> search(String word) async {
    var database = await DataBaseConnection.connectDatabase();

    List<Map<String,dynamic>> maps = await database.rawQuery("SELECT * FROM todo WHERE text LIKE '$word'");

    return List.generate(maps.length, (index) {
      var row = maps[index];
      return ToDo(id: row["id"], text: row["text"]);
    });
  }
}