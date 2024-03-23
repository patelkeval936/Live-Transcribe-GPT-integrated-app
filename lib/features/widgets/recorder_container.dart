import 'package:alindors_assignment/features/task2/presentation/widget/recorder_action_buttons.dart';
import 'package:alindors_assignment/features/task2/presentation/widget/recorder_widget.dart';
import 'package:alindors_assignment/features/widgets/shadowed_container.dart';
import 'package:alindors_assignment/utils/app_colors.dart';
import 'package:flutter/material.dart';

class RecorderContainer extends StatefulWidget {
  const RecorderContainer({super.key});

  @override
  State<RecorderContainer> createState() => _RecorderContainerState();
}

class _RecorderContainerState extends State<RecorderContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(20)),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 26, right: 26),
          child: Column(
            children: [
              ShadowedContainer(
                radius: 20,
                child: Container(
                  alignment: Alignment.center,
                  height: 44,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: AppColors.backgroundColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const RecorderWidget(),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 30),
                child: Text(
                  'Business partners discussed issues of supply disruptions from China. Ultimately they decided to find another supplier.',
                  style: TextStyle(),
                  textAlign: TextAlign.center,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(const BorderSide(color: Colors.white),),
                    ),
                    child: const Text(
                      'Full Text',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  OutlinedButton(  
                    onPressed: () {},
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(const BorderSide(color: Colors.blue),),
                    ),
                    child: const Text(
                      'Full Summary',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 12,
              )
            ],
          ),
        ),
      ),
    );
  }
}
