
import 'package:alindors_assignment/core/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';
import '../widget/recorder_widget.dart';

class RecordingPage extends StatefulWidget {
  const RecordingPage({super.key});

  @override
  State<RecordingPage> createState() => _RecordingPageState();
}

class _RecordingPageState extends State<RecordingPage> with SingleTickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: context.screenHeight,
        width: context.screenWidth,
        child: Stack(
          children: [
            SizedBox(
              height: context.screenHeight,
              width: context.screenWidth,
              child:  const RecorderWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
