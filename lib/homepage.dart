import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List todolist = [
    ['Example of list Event One', false],
    ['Example of list Event Two', true],
    ['Example of list Event Three', false],
    ['Example of list Event Four', true],
  ];

  changeIndex(index) {
    setState(() {
      todolist[index][1] = !todolist[index][1];
    });
  }

  addToListButton() {}

  void addToList() {
    TextEditingController event = TextEditingController();
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Add Event'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: event,
                    autofocus: true,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MaterialButton(
                        color: Colors.tealAccent,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancel'),
                      ),
                      MaterialButton(
                        color: Colors.tealAccent,
                        onPressed: () {
                          setState(() {
                            todolist.add([event.text, false]);
                            @override
                            void dispose() {
                              event.text;
                              super.dispose();
                            }
                          });
                          Navigator.of(context).pop();
                        },
                        child: const Text('Add'),
                      ),
                    ],
                  ),
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text('Todo App'),
        actions: [
          IconButton(
            onPressed: () {
              addToList();
            },
            icon: const Icon(
              Icons.add_box_outlined,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: todolist.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            decoration: BoxDecoration(
              color: Colors.teal.shade100,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  todolist[index][0],
                  style: const TextStyle(
                    fontSize: 19,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    changeIndex(index);
                  },
                  icon: Icon(
                    todolist[index][1]
                        ? Icons.check_circle
                        : Icons.circle_outlined,
                    color: todolist[index][1] ? Colors.green : Colors.redAccent,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
