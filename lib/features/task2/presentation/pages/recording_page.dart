import 'package:alindors_assignment/core/extensions/build_context_extensions.dart';
import 'package:alindors_assignment/features/ind_record.dart';
import 'package:alindors_assignment/features/task2/presentation/widget/quotes_and_conclusion.dart';
import 'package:alindors_assignment/features/widgets/custom_progress_bar.dart';
import 'package:alindors_assignment/features/widgets/custom_tabbar.dart';
import 'package:alindors_assignment/features/widgets/shadowed_container.dart';
import 'package:alindors_assignment/features/widgets/speaker.dart';
import 'package:alindors_assignment/utils/app_colors.dart';
import 'package:flutter/material.dart';
import '../widget/recorder_widget.dart';

class RecordingPage extends StatefulWidget {
  const RecordingPage({super.key});

  @override
  State<RecordingPage> createState() => _RecordingPageState();
}

class _RecordingPageState extends State<RecordingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: context.screenHeight,
        width: context.screenWidth,
        child: Stack(
          children: [
            Container(
              height: context.screenHeight,
              width: context.screenWidth,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const IndRecord(),
                    const SizedBox(
                      height: 12,
                    ),
                    const CustomTabBar(),
                    const SizedBox(
                      height: 12,
                    ),
                    const AboutSpeaker(),
                    ListView.separated(
                      shrinkWrap: true,
                      itemCount: 3,
                      primary: false,
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                      itemBuilder: (context, index) => Row(
                        children: [
                          Expanded(child: CustomProgressBar()),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(child: CustomProgressBar()),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const QuotesAndConclusion(
                      alignment: Alignment.centerLeft,
                      titleText: 'Quotes reflecting attitude towards me',
                      text: 'Quotes: here will be a set of quotes ',
                    ),
                    const QuotesAndConclusion(
                      alignment: Alignment.centerLeft,
                      titleText: 'Conclusion',
                      text:
                          'First, speaker mentioned he keeps a healthy lifestyle, but he likes alcohol as well...',
                    ),
                    const QuotesAndConclusion(
                      titleText: 'Favorite topics and interests',
                      text: 'Sport. Speaker mentioned he likes a golf...',
                    ),
                    const QuotesAndConclusion(
                      titleText: 'Least favorite topics',
                      text:
                          'First, speaker mentioned he keeps a healthy lifestyle, but he likes alcohol as well...',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
