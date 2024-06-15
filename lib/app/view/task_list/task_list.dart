import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lista_tareas/app/model/task.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'header.dart'; // Importa el nuevo widget Header
import 'cardTask.dart'; // Importa el nuevo widget TaskItem

class TaskListPage extends StatefulWidget {
  const TaskListPage({Key? key}) : super(key: key);

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  final taskList = <Task>[];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final tasksJson = prefs.getStringList('tasks');
    if (tasksJson != null) {
      final List tasksMap =
          tasksJson.map((e) => jsonDecode(e)).toList();
      final List<Task> loadedTasks =
          tasksMap.map((e) => Task.fromJson(e)).toList();
      setState(() {
        taskList.addAll(loadedTasks);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Header(), // Usar el widget Header
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              itemCount: taskList.length,
              itemBuilder: (_, index) => TaskItem(
                taskList[index],
                onTap: () {
                  setState(() {
                    taskList[index].done = !taskList[index].done;
                    _saveTasks();
                  });
                },
              ), // Usar el widget TaskItem
              separatorBuilder: (_, __) => const SizedBox(height: 16),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showNewTaskModal(context),
        child: const Icon(Icons.add, size: 50),
      ),
    );
  }

  void _showNewTaskModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => _NewTaskModal(onTaskCreated: (Task task) {
        setState(() {
          taskList.add(task);
          _saveTasks();
        });
      }),
    );
  }

  Future<void> _saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> tasksJson =
        taskList.map((e) => jsonEncode(e.toJson())).toList();
    prefs.setStringList('tasks', tasksJson);
  }
}

class _NewTaskModal extends StatelessWidget {
  const _NewTaskModal({Key? key, required this.onTaskCreated}) : super(key: key);

  final void Function(Task task) onTaskCreated;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 23),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(21)),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Nueva tarea',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 26),
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              hintText: 'Descripción de la tarea',
            ),
          ),
          const SizedBox(height: 26),
          ElevatedButton(
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                final task = Task(_controller.text, done: false);
                onTaskCreated(task);
                Navigator.of(context).pop();
              }
            },
            child: const Text('Guardar'),
          ),
        ],
      ),
    );
  }
}

final taskList = <Task>[
  Task('Programar una página web', done: false),
  Task('Aprender HTML y CSS', done: true),
];
