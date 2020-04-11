import 'package:intl/intl.dart';

class Todo{
  
  String name;
  String date;
  bool done;

  Todo(String name){
    this.name = name;
    this.date = DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());
    this.done = false;
  }

}