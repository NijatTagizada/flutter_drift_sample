import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_database.dart';
import 'models.dart';

final addTaskProvider =
    StateNotifierProvider<AddTaskState, AsyncValue<List<TypeModel>>>((ref) {
  return AddTaskState(ref.watch(databaseProvider))..getAllTypes();
});

class AddTaskState extends StateNotifier<AsyncValue<List<TypeModel>>> {
  AddTaskState(this.database) : super(const AsyncValue.loading());

  final AppDatabase database;

  Future<void> getAllTypes() async {
    state = const AsyncValue.loading();

    try {
      final data = await database.getAllTypes();
      state = AsyncValue.data(data);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}
