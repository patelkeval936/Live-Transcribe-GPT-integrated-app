import 'package:alindors_assignment/features/ind_record.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/bloc_observer.dart';
import 'features/task2/presentation/pages/recording_page.dart';
import 'features/task2/presentation/pages/live_transcribe_page.dart';
import 'features/task2/presentation/recorder_bloc/recorder_bloc.dart';
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await initializeDependencies();
  runApp(const MyApp());
}

//66,96,123
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(
        useMaterial3: true,
      ).copyWith(
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                // side: Border.all(color: Colors.white)
              ),
            ),
          ),
        ),
      ),
      // home: const IndRecord(),
      home: MultiBlocProvider(providers: [
        BlocProvider(
          create: (_) => sl<RecorderBloc>(),
        ),
      ], child: const LiveTranscriptionPage(title: 'Live Transcribe',)),
    );
  }
}
