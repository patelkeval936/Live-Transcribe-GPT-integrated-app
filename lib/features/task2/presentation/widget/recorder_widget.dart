import 'dart:io';

import 'package:alindors_assignment/core/extensions/build_context_extensions.dart';
import 'package:alindors_assignment/features/task2/presentation/widget/recorder_action_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_waveforms/flutter_audio_waveforms.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import '../recorder_bloc/recorder_bloc.dart';

class RecorderWidget extends StatefulWidget {
  const RecorderWidget({super.key});

  @override
  State<RecorderWidget> createState() => _RecorderWidgetState();
}

class _RecorderWidgetState extends State<RecorderWidget> {
  String audiDirectory = '';

  getDirectory() async {
    Directory dir = await getApplicationCacheDirectory();

    setState(() {
      audiDirectory = '${dir.path}/myFile.m4a';
    });
  }

  @override
  void initState() {
    getDirectory();
    super.initState();
  }


  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    print('audio directory is ${audiDirectory}');
    return BlocBuilder<RecorderBloc, RecorderState>(
      builder: (context, state) {
        if(controller.hasClients) {
          controller.animateTo(controller.position.maxScrollExtent,
              duration: Duration(seconds: 1), curve: Curves.linear);
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (state.recordedTime > 0)
              SizedBox(
                height: 100,
                child: SingleChildScrollView(
                  controller: controller,
                  child: SquigglyWaveform(
                    // url: audioFileUrl,
                    // waveFormType: WaveFormType.material,
                    // onWaveFormRender: (values) {
                    //   // Optional: Perform any actions when the waveform is rendered.
                    // },
                    samples: [...state.waveformValues.map((e) => e.toDouble())],
                    height: 100,
                    width: state.waveformValues.length * 0.01 * context.screenWidth,
                    maxDuration: Duration(seconds: state.recordedTime),
                    elapsedDuration: Duration(seconds: state.playedTime),
                  ),
                ),
              ),
            const SizedBox(height: 40),
            RecorderActionButtons(state: state),
          ],
        );
      },
    );
  }
}
