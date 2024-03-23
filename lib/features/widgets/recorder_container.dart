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
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 26, right: 26),
          child: Column(
            children: [
              ShadowedContainer(
                  radius: 20,
                  child: Container(
                    height: 44,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: AppColors.backgroundColor,
                        borderRadius: BorderRadius.circular(20)),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 30),
                child: Text(
                  'Business partners discussed issues of supply disruptions from China. Ultimately they decided to find another supplier.',
                  style: TextStyle(),
                  textAlign: TextAlign.center,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton(onPressed: () {}, child: Text('Full Text'),
                  ),
                  OutlinedButton(onPressed: () {}, child: Text('Full Summary'))
                ],
              ),
              SizedBox(
                height: 12,
              )
            ],
          ),
        ),
      ),
    );
  }
}
