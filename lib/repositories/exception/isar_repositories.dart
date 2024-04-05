// }
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:test_intern/isar/project.dart';
import 'package:test_intern/isar/task_recent.dart';

class IsarRepository {
  Future<Isar> init() async {
    final dir = await getApplicationDocumentsDirectory();
    final isar = await Isar.open(
      [ProjectSchema, TaskRecentSchema],
      directory: dir.path,
      name: 'Predo_project',
    );
    return isar;
  }
}
