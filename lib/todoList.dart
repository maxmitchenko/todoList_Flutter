class TodoList extends StatefulWidget {
  @override
  createState() => new TodoListState();
}

class TodoListState extends State<TodoList> {
  List<String> _todoItems = [];

  void _addTodoItem(String task) {
    // Only add the task if the user actually entered something
    if(task.length > 0) {      
      setState(() => _todoItems.add(task));
    }
  }

  void _removeTodoItem(int index) {
    setState(() => _todoItems.removeAt(index));
  }

  void _promptRemoveTodoItem(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('Do you really want to delete "${_todoItems[index]}" ?'),
          actions: <Widget>[
            new FlatButton(
              child: new Text('CANCEL'),              
              onPressed: () => Navigator.of(context).pop()
            ),
            new FlatButton(
              child: new Text('YES, DELETE'),
              onPressed: () {
                _removeTodoItem(index);
                Navigator.of(context).pop();
              }
            )
          ]
        );
      }
    );
  }
  
  Widget _buildTodoList() {
    return new ListView.builder(
      itemBuilder: (context, index) {        
        if(index < _todoItems.length) {
          return _buildTodoItem(_todoItems[index], index);
        }
      },
    );
  }

  BoxDecoration myBoxDecoration()  {
        return BoxDecoration(
          border: Border(
            left: BorderSide(
              color: Colors.blue[100],
              width: 10.0,
            ),
            top: BorderSide(
              color: Colors.blue[100],
              width: 10.0,
            ),
            right: BorderSide(
              color: Colors.blue[100],
              width: 10.0,
            ),
            bottom: BorderSide(
              color: Colors.blue[100],
              width: 10.0,
            ),
          ),
        );
      }

  // Todo itemS
  Widget _buildTodoItem(String todoText, int index) {
    return new Container(
    child: new ListTile(
      title: new Text(todoText),
      
      onTap: () => _promptRemoveTodoItem(index)
    ),
    decoration: myBoxDecoration(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Todo List')
      ),
      body: _buildTodoList(),
      floatingActionButton: new FloatingActionButton(
        onPressed: _pushAddTodoScreen,
        tooltip: 'Add task',
        child: new Icon(Icons.add)
      ),
    );
  }

  void _pushAddTodoScreen() {
    // Push this page onto the stack
    Navigator.of(context).push(
      // MaterialPageRoute will automatically animate the screen entry, as well as adding
      // a back button to close it
      new MaterialPageRoute(
        builder: (context) {
          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Add a new task')
            ),
            body: new TextField(
              autofocus: true,
              onSubmitted: (val) {
                _addTodoItem(val);
                Navigator.pop(context); // Close the add todo screen
              },
              decoration: new InputDecoration(
                hintText: 'Enter something to do...',
                contentPadding: const EdgeInsets.all(16.0)
              ),
            )
          );
        }
      )
    );
  }
}