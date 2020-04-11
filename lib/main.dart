import 'package:flutter/material.dart';
import 'package:todo_list/todo.dart';

void main(List<String> args) {
  runApp(new TaskListApp());
}

class TaskListApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new TaskScreen(),
      title: "To-do List",
    );
  }
}

class TaskScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new TaskScreenState();
  }
}

class TaskScreenState extends State<TaskScreen>{

  List<Todo> tasks = new List<Todo>();

  TextEditingController controller = new TextEditingController();

  void addTask(String name){
    setState(() {
      tasks.add(Todo(name));
      controller.clear();
    });
  }

  Widget getItem(Todo task){
    return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                IconButton(
                  icon: new Icon(task.done ? Icons.check_box : Icons.check_box_outline_blank), 
                  iconSize: 50,
                  padding: EdgeInsets.only(left: 10, right: 20),
                  onPressed: (){
                    setState(() {
                      task.done = !task.done;
                    });
                  },
                  color: Colors.green,
              ),
              new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(task.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, decoration: task.done ? TextDecoration.lineThrough : TextDecoration.none)),
                  Text(task.date, style: TextStyle(decoration: task.done ? TextDecoration.lineThrough : TextDecoration.none),),
                  
                ],
              )
              ],
              );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: Text('To-do List',),
          backgroundColor: Color.fromRGBO(0, 200, 0, 1),
          centerTitle: false         
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(8),
                child: TextField(
                  cursorColor: Colors.green,
                  decoration: InputDecoration(
	  hintText: 'Type Your Task',        
          enabledBorder: UnderlineInputBorder(      
	  borderSide: BorderSide(color: Colors.green),   
	  ),  
	  focusedBorder: UnderlineInputBorder(
	  borderSide: BorderSide(color: Colors.transparent),
	   ),  
	  ),
                  
                  controller: controller,
                  onSubmitted: addTask
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (_, indice){
                    return getItem(tasks[indice]);
                  },
                )
              )
              
            ],
        )
      );
  }

}