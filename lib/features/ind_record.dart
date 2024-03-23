
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
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 56,),
          Text('Chat About China'),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8,vertical: 16),
            child: RecorderContainer(),
          ),
          Center(
            child: CustomProgressBar(),
          ),
        ],
      ),
    );
  }
}
