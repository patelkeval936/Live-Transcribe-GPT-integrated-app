import 'package:alindors_assignment/features/task2/presentation/widget/recorder_cta.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../recorder_bloc/recorder_bloc.dart';

class RecorderActionButtons extends StatelessWidget {
  const RecorderActionButtons({
    super.key,
    required this.state,
  });

  final RecorderState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
                child: const Text('Delete'),
                onPressed: () {
                  context.read<RecorderBloc>().add(RecordingDelete());
                }),
            RecorderCTA(
              state: state,
            ),
            ElevatedButton(
                child: const Text('Submit'),
                onPressed: () {
                  context.read<RecorderBloc>().add(RecordingSubmit());
                }),
          ],
        ),
      ],
    );
  }
}
