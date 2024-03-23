
import 'package:alindors_assignment/features/widgets/custom_progress_bar.dart';
import 'package:alindors_assignment/features/widgets/recorder_container.dart';
import 'package:flutter/material.dart';

class IndRecord extends StatefulWidget {
  const IndRecord({super.key});

  @override
  State<IndRecord> createState() => _IndRecordState();
}

class _IndRecordState extends State<IndRecord> {

  @override
  Widget build(BuildContext context) {
    return const Column(
        children: [
          SizedBox(height: 56,),
          Text('Chat About China'),
         Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: RecorderContainer(),
          ),
        ],
      );
  }
}
