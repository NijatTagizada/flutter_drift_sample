import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_database.dart';
import 'models.dart';

final homeProvider =
    StateNotifierProvider<HomeState, AsyncValue<List<TaskModel>>>((ref) {
  return HomeState(ref.watch(databaseProvider))..getAllTask();
});

class HomeState extends StateNotifier<AsyncValue<List<TaskModel>>> {
  HomeState(this.database) : super(const AsyncValue.loading());

  final AppDatabase database;

  Future<void> getAllTask() async {
    state = const AsyncValue.loading();

    try {
      final data = await database.getAllTasks();
      state = AsyncValue.data(data);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}
