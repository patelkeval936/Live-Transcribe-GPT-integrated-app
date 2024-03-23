import 'package:get_it/get_it.dart';
import 'package:record/record.dart';
import 'features/task2/presentation/recorder_bloc/recorder_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<AudioRecorder>(AudioRecorder());

  sl.registerSingleton<RecorderBloc>(RecorderBloc(sl()));
}
