import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'add_task_state.dart';
import 'app_database.dart';
import 'home_state.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    ),
  );
}

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allTask = ref.watch(homeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Drift'),
      ),
      body: allTask.when(
        data: (data) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(data[index].title),
                subtitle: Text(data[index].type.typeName),
                onTap: () async {
                  /// Open detail package
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TaskDetail(),
                    ),
                  );
                },
                trailing: IconButton(
                  icon: const Icon(Icons.delete_outline),
                  onPressed: () async {
                    /// Delete task from database
                    await ref.read(databaseProvider).deleteTask(data[index].id);
                    ref.read(homeProvider.notifier).getAllTask();
                  },
                ),
              );
            },
          );
        },
        error: (_, __) => const Text('Error'),
        loading: () => const CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddTask(),
            ),
          );
        },
        label: const Row(
          children: [
            Icon(Icons.add),
            SizedBox(width: 8),
            Text('Add'),
          ],
        ),
      ),
    );
  }
}

class AddTask extends ConsumerStatefulWidget {
  const AddTask({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddTaskState();
}

class _AddTaskState extends ConsumerState<AddTask> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController taskTitleCtrl = TextEditingController();
  int selectedType = 0;

  @override
  void dispose() {
    taskTitleCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final types = ref.watch(addTaskProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new task'),
      ),
      body: types.when(
        data: (data) {
          return Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: taskTitleCtrl,
                    validator: (value) {
                      if (value != null && value.trim().isNotEmpty) {
                        return null;
                      }
                      return 'Fill input';
                    },
                    decoration: const InputDecoration(
                      filled: true,
                      border: UnderlineInputBorder(),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                      hintText: 'Task title',
                    ),
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 10,
                    children: List<Widget>.generate(
                      3,
                      (int index) {
                        return ChoiceChip(
                          label: Text(data[index].typeName),
                          selected: selectedType == index,
                          onSelected: (bool selected) {
                            setState(() {
                              selectedType = selected ? index : 0;
                            });
                          },
                        );
                      },
                    ).toList(),
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: OutlinedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          await ref.read(databaseProvider).insertTask(
                                taskTitleCtrl.text,
                                data[selectedType].id,
                              );

                          ref.read(homeProvider.notifier).getAllTask();
                          Navigator.pop(context);
                        }
                      },
                      child: const Text('Add'),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        error: (_, __) => const Text('Error'),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}

class TaskDetail extends ConsumerWidget {
  const TaskDetail({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Title', style: TextStyle(fontSize: 18)),
            const Text(
              'task title #1',
            ),
            const SizedBox(height: 10),
            const Text('Type', style: TextStyle(fontSize: 18)),
            const Text('Other'),
            const SizedBox(height: 10),
            const Text('Attendants', style: TextStyle(fontSize: 18)),
            ...List.generate(3, (index) => Text('Attendant #$index'))
          ],
        ),
      ),
    );
  }
}
