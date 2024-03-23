
import 'package:alindors_assignment/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';

class RecordButton extends StatefulWidget {
  const RecordButton({super.key});

  @override
  State<RecordButton> createState() => _RecordButtonState();
}

class _RecordButtonState extends State<RecordButton> {
  @override
  Widget build(BuildContext context) {
    return
      RippleAnimation(
        color: AppColors.primary,
        delay: const Duration(milliseconds: 600),
        repeat: true,
        minRadius: 24,
        ripplesCount: 3,
        duration: const Duration(milliseconds: 3 * 1000),
        child:
          Container(
          height: 38,
          width: 38,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(19),
          ),
            child: Icon(Icons.mic,color: Colors.black,size: 14,),
        ),
      );



  }
}
