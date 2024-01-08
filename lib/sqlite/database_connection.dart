import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseConnection {
  static final String databaseName = "toDos.sqlite";
  static Future<Database> connectDatabase() async {
    String databasePath = join(await getDatabasesPath(),databaseName);

    if(await databaseExists(databasePath)) {
      print("No prob");
    } else {
      ByteData data = await rootBundle.load("database/$databaseName");
      List<int> bytes = data.buffer.asInt8List(data.offsetInBytes,data.lengthInBytes);
      await File(databasePath).writeAsBytes(bytes,flush: true);
      print("Copied Database");
    }

    return openDatabase(databasePath);
  }
}