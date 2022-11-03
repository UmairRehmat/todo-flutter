import 'package:get_it/get_it.dart';

import 'features/add_task/data/data_source/add_task_local_data_source.dart';
import 'features/add_task/data/data_source/show_task_local_data_source.dart';
import 'features/add_task/data/models/task_model.dart';
import 'features/add_task/data/repository/add_task_repository.dart';
import 'features/add_task/data/repository/show_task_repository.dart';
import 'features/add_task/domain/repository/add_task_repository.dart';
import 'features/add_task/domain/repository/show_task_repository.dart';
import 'features/add_task/domain/use_case/add_task_usecase.dart';
import 'features/add_task/domain/use_case/show_task_use_case.dart';

final sl = GetIt.I;
// final GetIt sl=GetIt.instance;

Future<void> init() async {
  //Use case
  sl.registerLazySingleton(() => AddTaskUseCase(sl()));
  sl.registerLazySingleton(() => AllTasksUseCase(sl()));
  sl.registerLazySingleton(() => TaskModel());

  //Repository
  sl.registerLazySingleton<AddTaskRepository>(
      () => AddTaskRepositoryImpl(localSource: sl()));

  sl.registerLazySingleton<ShowTaskRepository>(
      () => ShowTaskRepositoryImpl(sl()));

  //Data Source
  sl.registerLazySingleton<AddTasksLocalDataSource>(
      () => const AddTasksLocalDataSourceImpl());

  sl.registerLazySingleton<ShowTaskLocalDataSource>(
      () => const ShowTaskLocalDataSourceImpl());

  //Data base
  sl.registerLazySingleton(() => List<TaskModel>);
}
